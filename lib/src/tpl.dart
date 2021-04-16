const String clazzTpl = """
{{#refs}}
import '{{{path}}}';
{{/refs}}
import 'package:flutter/widgets.dart';
import 'package:annotation_route/src/router_manager.dart';

class MNRouterImpl{
  MNRouterImpl._();
  static final Map<String, CreatePageInstance> _routerMap =
      <String, CreatePageInstance>{{{routerMap}}};

  static bool hasPage(String path) {
    return _routerMap.containsKey(path);
  }

  static Widget findPage(String path) {
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
