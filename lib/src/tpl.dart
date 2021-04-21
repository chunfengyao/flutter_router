const String clazzTpl = """
{{{import_block}}}
import 'package:flutter/widgets.dart';
import 'package:manniu_router/src/router_function_define.dart';

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
