import 'package:annotation_route/route.dart';
import 'package:flutter/widgets.dart';


@MNRouter('myapp://pagea')
class A extends Widget{
  int a;
  String b;
  A() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

}
