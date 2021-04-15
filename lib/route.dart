/**
 * Annotation class that supports you annotate a route page with @MNRoute
 */
class MNRouter {
  /**
   * Used to match a route, and will the first match condition
   */
  final String path;
  /**
   * Used to math a route
   */
  final Map<String, dynamic> params;
  const MNRouter(this.path, {this.params});
}

/**
 * Annotation class that supports you annotate your own router class @MNRouteRoot
 */
class MNRouteRoot {
  const MNRouteRoot();
}

/**
 * This represent a condition collection to match a route
 */
class MNRouteOption {
  String pathPattern;
  Map<String, dynamic> params;
  MNRouteOption(this.pathPattern, this.params);
}

enum MNRouterResultState { FOUND, REDIRECT, NOT_FOUND }

/**
 *  The result of findPage in [MNRouterInternal]
 */
class MNRouterResult {
  /**
   * The annotated widget found
   */
  dynamic widget;
  /**
   * [TODO]
   */
  String interceptor;
  /**
   * The state represents a kind of result
   */
  MNRouterResultState state;
  MNRouterResult({this.state, this.widget, this.interceptor});
}

/**
 * The public interface to find a annotated route
 */
abstract class MNRouterInternal {
  bool hasPageConfig(MNRouteOption option);
  MNRouterResult findPage(MNRouteOption option, dynamic initOption);
}
