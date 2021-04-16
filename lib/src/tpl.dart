const String clazzTpl = """
{{#refs}}
import '{{{path}}}';
{{/refs}}
import 'package:flutter/widgets.dart';
import 'package:annotation_route/src/router_manager.dart';

class MNRouterImpl{
  MNRouterImpl._();
  static Map<String, MNRouterCreatePage> get routerMap => _routerMap;
  static final Map<String, MNRouterCreatePage> _routerMap =
      <String, MNRouterCreatePage>{{{routerMap}}};

  static bool hasPage(String path) {
    return _routerMap.containsKey(path);
  }

  static Widget findPage(String path) {
    MNRouterCreatePage func;
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
