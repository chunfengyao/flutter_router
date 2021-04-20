import 'package:mustache4dart/mustache4dart.dart';
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

  String write() {
    final List<Map<String, String>> refs = <Map<String, String>>[];
    final Function addRef = (String path) {
      refs.add(<String, String>{'path': path});
    };
    collector.importList.forEach(addRef);
    return render(clazzTpl, <String, dynamic>{
      'refs': refs,
      'routerMap': collector.routerMap.map((String key, dynamic element) {
        return MapEntry('\'${key}\'', '() => ${element}()');
      }).toString()
    });
  }
}
