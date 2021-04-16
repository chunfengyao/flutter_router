import 'package:annotation_route/route.dart';
import 'package:flutter/widgets.dart';


@MNRouter('myapp://pageb', params: {'parama': 'b'})
class B extends Widget{
  int a;
  String b;
  B() : super();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
