/// <pre>
/// Used to 路由的一些功能的定义
/// <pre/>
/// created by:   yaochunfeng
/// on:           2021/4/20 4:15 下午
/// Email:        yaochunfeng@wondersgroup.com

import 'package:flutter/widgets.dart';

typedef MNRouterFindPage = Widget Function(String path);
typedef MNRouterPushRoute = void Function(Widget widget);
typedef MNRouterCreatePage =  Widget Function();
