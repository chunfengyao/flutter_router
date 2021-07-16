import 'dart:convert' hide JsonDecoder;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

class Collector {
  Collector();
  Map<String, String> routerMap =
      <String, String>{};
  List<String> importList = <String>[];

  // Map<String, DartObject> toStringDartObjectMap(
  //     Map<DartObject, DartObject> map) {
  //   return map.map((DartObject k, DartObject v) {
  //     return MapEntry<String, DartObject>(k.toStringValue(), v);
  //   });
  // }

  // Map<String, String> toStringStringMap(Map<DartObject, DartObject> map) {
  //   return map.map((DartObject k, DartObject v) {
  //     return MapEntry<String, String>(k.toStringValue(), v.toStringValue());
  //   });
  // }

  void collect(
      Element element, ConstantReader annotation, BuildStep buildStep) {
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
      importClazz(
          "package:${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '')}");
    } else {
      importClazz("${buildStep.inputId.path}");
    }
  }

  // Map<String, dynamic> genPageConfigFromConstantReader(
  //     ConstantReader reader, ClassElement element) {
  //   final ConstantReader params = reader.peek('params');
  //   final Map<String, dynamic> map = <String, dynamic>{wK('clazz'): element};
  //   if (params != null) {
  //     final Map<String, String> paramsMap = toStringStringMap(params.mapValue);
  //     map[wK('params')] = "${wK(json.encode(paramsMap))}";
  //   }
  //   return map;
  // }

  void importClazz(String path) {
    importList.add(path);
  }
}
