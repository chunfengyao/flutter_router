import 'package:annotation_route/route.dart';
import 'package:flutter/widgets.dart';


@MNRouter('myapp://paged')
class D extends Widget{
  int a;
  String b;
  D() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

}
