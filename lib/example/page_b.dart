import 'package:annotation_route/route.dart';

@MNRouter('myapp://pageb', params: {'parama': 'b'})
class B {
  int a;
  String b;
  B(MNRouteOption option) : super();
}
