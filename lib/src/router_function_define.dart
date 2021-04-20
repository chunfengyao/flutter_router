import 'package:flutter/widgets.dart';

typedef MNRouterFindPage = Widget Function(String path);
typedef MNRouterPushRoute = void Function(Widget widget);
typedef MNRouterCreatePage =  Widget Function();
