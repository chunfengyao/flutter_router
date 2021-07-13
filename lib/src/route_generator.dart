import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import '../route.dart';
import 'collector.dart';
import 'writer.dart';

Collector routeCollector = Collector();

class RouteCollector extends GeneratorForAnnotation<MNRoute> {

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    routeCollector.collect(element, annotation, buildStep);
    return null;
  }
}

class RouteGenerator extends GeneratorForAnnotation<MNRouteRoot> {

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return Writer(routeCollector).write();
  }
}
