import 'package:annotation_route/route.dart';
import 'router.route.manniu_router.g.dart';

@MNRouteRoot()
class Router {
  dynamic getPage(String path) {
    return MNRouterImpl.findPage(path);
  }
}

class MyRouteOption {
  String pathPattern;
  Map<String, dynamic> params;
}
