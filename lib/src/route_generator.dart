import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import '../route.dart';

class RouteCollector extends GeneratorForAnnotation<MNRoute> {
  static const String RouteMapFileExtention = ".route.manniu.dart";
  Map<String, String> routerMap =
  <String, String>{};
  List<String> importList = <String>[];

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if(annotation.peek("isRouteMap")!.boolValue){
      return write(importList, routerMap);
    }else {
      final String className = element.displayName;
      final String path = annotation.peek('path')!.stringValue;
      //记录路径和被注解的类的类型
      routerMap[path] = className;
      // if (element.constructors.length > 0) {
      //   print('constructors displayName = ${element.constructors.first.displayName}');
      //   print('constructors name = ${element.constructors.first.name}');
      //   print('constructors type.parameters = ${element.constructors.first.type.parameters.first.type.name}');
      // }

      if (buildStep.inputId.path.contains('lib/')) {
        importList.add(
            "package:${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '')}");
      } else {
        importList.add("${buildStep.inputId.path}");
      }
      return null;
    }
  }

  @override
  Future<Iterable<AssetId>> manualRunBuilder(int phaseNumber, Set<AssetId> primaryInputs, BuilderRunner builderRunner) async{
    Set<AssetId> handleSet = Set();
    Set<AssetId> result = Set();
    AssetId? lastone = null;
    primaryInputs.forEach((element) {
      if(element.path.endsWith(RouteMapFileExtention)){
        lastone = element;
      }else{
        handleSet.add(element);
      }
    });
    //运行第一块
    result.addAll(await builderRunner(phaseNumber, handleSet));
    //运行第二块
    if(lastone != null){
      result.addAll(await builderRunner(phaseNumber, Set<AssetId>()..add(lastone!)));
    }else{
      throw Exception('您未定义路由表输出文件，或者您的路由表文件后缀名有误！正确的后缀名："' + RouteMapFileExtention + '"');
    }
    return result;
  }

  ///处理模板（替换占位符号为指定内容）
  static String handleTemplete(String clazzTpl, Map<String, String> map) {
    String result = clazzTpl;
    map.forEach((String key, String value) {
      result = result.replaceAll('{{{${key}}}}', value);
    });
    return result;
  }

  static String write(List<String> importList, Map<String, String> routerMap) {
    String importBlock = '';
    importList.forEach((String path) {
      importBlock += '\nimport \'${path}\';';
    });
    return handleTemplete(clazzTpl, <String, String>{
      'import_block': importBlock,
      'routerMap': routerMap.map((String key, dynamic element) {
        return MapEntry('\'${key}\'', '() => ${element}()');
      }).toString()
    });
  }
}

const String clazzTpl = """
{{{import_block}}}
import 'package:flutter/widgets.dart';
import 'package:manniu_router/manniu_router.dart';

class MNRouterImpl{
  MNRouterImpl._();
  static Map<String, MNRouterCreatePage> get routerMap => _routerMap;
  static final Map<String, MNRouterCreatePage> _routerMap =
      <String, MNRouterCreatePage>{{{routerMap}}};

  static bool hasPage(String path) {
    return _routerMap.containsKey(path);
  }

  static Widget? findPage(String path) {
    MNRouterCreatePage? func;
    if((func = _routerMap[path]) != null) {
      return func!();
    }else{
      return null;
    }
  }
}

""";