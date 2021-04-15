import 'package:annotation_route/route.dart';
import 'router.route.internal.dart';

@MNRouteRoot()
class Router {
  MNRouterInternal internal = MNRouterInternalImpl();
  dynamic getPage(MyRouteOption option) {
    return internal.findPage(
        MNRouteOption(option.urlpattern, option.params), option);
  }
}

class MyRouteOption {
  String urlpattern;
  Map<String, dynamic> params;
}
