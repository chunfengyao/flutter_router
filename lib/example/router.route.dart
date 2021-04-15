import 'package:annotation_route/route.dart';
import 'router.route.manniu_router.g.dart';

@MNRouteRoot()
class Router {
  MNRouterInternal internal = MNRouterInternalImpl();
  dynamic getPage(MyRouteOption option) {
    return internal.findPage(
        MNRouteOption(option.pathPattern, option.params), option);
  }
}

class MyRouteOption {
  String pathPattern;
  Map<String, dynamic> params;
}
