import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'src/route_generator.dart';

Builder routeBuilder(BuilderOptions options) => LibraryBuilder(RouteGenerator(),
    generatedExtension: '.g.dart');

Builder routeWriteBuilder(BuilderOptions options) =>
    LibraryBuilder(RouteWriterGenerator(),
        generatedExtension: '.manniu_router.g.dart');
