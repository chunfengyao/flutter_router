import 'package:annotation_route/route.dart';
import 'package:flutter/widgets.dart';


@MNRouter('myapp://pagec')
class C extends Widget{
  int a;
  String b;
  C() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
