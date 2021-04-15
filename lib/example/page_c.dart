import 'package:annotation_route/route.dart';

@MNRouter('myapp://pagec')
class C {
  int a;
  String b;
  C(MNRouteOption option) : super();
}
