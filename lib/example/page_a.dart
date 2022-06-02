import 'package:manniu_router/route.dart';
import 'package:flutter/widgets.dart';

@MNRoute('/demo/pagea', tags: ["123134","asdfasdfadsfa"], options: {"from": "adsfaf3e",})
class A extends Widget{
  int? a;
  String? b;
  A() : super();

  @override
  Element createElement() {
    throw UnimplementedError();
  }

}
