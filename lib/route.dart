/**
 * Annotation class that supports you annotate a route page with @MNRoute
 */
class MNRoute {
  final bool isRouteMap;
  /**
   * Used to match a route, and will the first match condition
   */
  final String? path;
  /**
   * Used to tag a page , prepare for page manager.
   */
  final List<String>? tags;
  /**
   * Used to tag a page , prepare for page manager.
   */
  final Map<String, String?>? options;
  /**
   * Used to name a route, prepare for generator entrance page.
   */
  final String? pageName;
  /**
   * Used to math a route
   */
  const MNRoute(this.path, {this.pageName, this.isRouteMap = false, this.tags = null, this.options = null});
  const MNRoute.Root({this.path, this.pageName, this.isRouteMap = true, this.tags = null, this.options = null});
}

/**
 * Annotation class that supports you annotate your own router class @MNRouteRoot
 */
@Deprecated("use `MNRoute.Roo`, please!")
class MNRouteRoot {
  const MNRouteRoot();
}
