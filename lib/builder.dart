import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'src/route_generator.dart';

//用来收集路由信息的生成器
Builder routeCollectBuilder(BuilderOptions options) {
  return LibraryBuilder(RouteCollector()
      , generatedExtension: '.manniu_router_part.g.dart');
}
