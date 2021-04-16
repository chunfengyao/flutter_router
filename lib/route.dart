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
