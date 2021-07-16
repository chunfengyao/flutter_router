/**
 * Annotation class that supports you annotate a route page with @MNRoute
 */
class MNRoute {
  /**
   * Used to match a route, and will the first match condition
   */
  final String path;
  /**
   * Used to name a route, prepare for generator entrance page.
   */
  final String pageName;
  /**
   * Used to math a route
   */
  const MNRoute(this.path, {this.pageName});

}

/**
 * Annotation class that supports you annotate your own router class @MNRouteRoot
 */
class MNRouteRoot {
  const MNRouteRoot();
}
