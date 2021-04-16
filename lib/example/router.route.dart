import 'package:annotation_route/route.dart';
import 'router.route.manniu_router.g.dart';

@MNRouteRoot()
class Router {
  MNRouterImpl internal = MNRouterImpl();
  dynamic getPage(String path) {
    return internal.findPage(path);
  }
}

class MyRouteOption {
  String pathPattern;
  Map<String, dynamic> params;
}
