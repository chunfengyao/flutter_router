import 'collector.dart';
import 'tpl.dart';

class Writer {
  Collector collector;
  Writer(this.collector);

  // String instanceFromClazz() {
  //   final StringBuffer buffer = new StringBuffer();
  //   buffer..writeln('switch(clazz) {');
  //   final Map<String, bool> mappedClazz = <String, bool>{};
  //   final Function writeClazzCase = (Map<String, dynamic> config) {
  //     final dynamic clazz = config[wK('clazz')];
  //     if (clazz is ClassElement) {
  //         if (mappedClazz[clazz.name] == null) {
  //           mappedClazz[clazz.name] = true;
  //         } else {
  //           return;
  //         }
  //
  //         if (clazz.constructors.isEmpty || clazz.constructors.first.type.parameters.isEmpty) {
  //           buffer.writeln('case ${clazz.name}: return new ${clazz.name}();');
  //         } else {
  //           buffer.writeln('case ${clazz.name}: return new ${clazz.name}(option);');
  //         }
  //     }
  //     // buffer.writeln('case ${clazz}: return new ${clazz}(option);');
  //   };
  //   buffer..writeln('default:return null;')..writeln('}');
  //   return buffer.toString();
  // }


  ///处理模板（替换占位符号为指定内容）
  String handleTemplete(String clazzTpl, Map<String, String> map) {
    String result = clazzTpl;
    map.forEach((String key, String value) {
      result = result.replaceAll('{{{${key}}}}', value);
    });
    return result;
  }

  String write() {
    String importBlock = '';
    collector.importList.forEach((String path) {
      importBlock += '\nimport \'${path}\';';
    });
    return handleTemplete(clazzTpl, <String, String>{
      'import_block': importBlock,
      'routerMap': collector.routerMap.map((String key, dynamic element) {
        return MapEntry('\'${key}\'', '() => ${element}()');
      }).toString()
    });
  }
}
