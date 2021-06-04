import 'package:manniu_router/route.dart';
import 'package:flutter/widgets.dart';


@MNRoute('/demo/pagea')
class A extends Widget{
  int? a;
  String? b;
  A() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

}
