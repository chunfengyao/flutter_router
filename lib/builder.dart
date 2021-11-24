import 'package:manniu_router/src/manniu_router_generator.dart';
import 'package:build/build.dart';

//用来收集路由信息的生成器
Builder routeCollectBuilder(BuilderOptions options) {
  return RouteGenerator(options, extension: '.g.dart');
}
