const String clazzTpl = """
{{#refs}}
import '{{{path}}}';
{{/refs}}
import 'package:annotation_route/src/collector.dart';



typedef CreatePageInstance =  dynamic Function();

class MNRouterImpl{
  MNRouterImpl();
  static final Map<String, CreatePageInstance> _routerMap =
      <String, CreatePageInstance>{{{routerMap}}};

  @override
  bool hasPage(String path) {
    return _routerMap.containsKey(path);
  }

  @override
  dynamic findPage(String path) {
    CreatePageInstance func;
    if((func = _routerMap[path]) != null) {
      return func();
    }else{
      return null;
    }
  }
}

""";

const String instanceCreatedTpl = """
""";
