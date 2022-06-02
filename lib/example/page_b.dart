import 'package:manniu_router/route.dart';
import 'package:flutter/widgets.dart';

@MNRoute('/demo/pageb')
class B extends Widget{
  int? a;
  String? b;
  B() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
