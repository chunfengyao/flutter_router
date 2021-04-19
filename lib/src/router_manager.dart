import 'package:flutter/widgets.dart';

typedef MNRouterFindPage = Widget Function(String path);
typedef MNRouterPushRoute = void Function(Widget widget);
typedef MNRouterCreatePage =  Widget Function();

/// <pre>
/// Used to 路由管理类,用来获取页面实例、判断路由组、传递和获取页面参数。
/// <pre/>
class MNRouter{
  static Map<String, MNRouterCreatePage> _groups;
  static Map<int, Widget> _paramsStorage;
  static final MNRouter _INSTANCE = MNRouter();
  get Instance => _INSTANCE;

  ///初始化路由（将子模块的路由传递给管理类，并且提供找页面的功能。）
  static void addRouter(Map<String, MNRouterCreatePage> routerPageProvider){
    //如果groupName已经存在，则直接报错！！！
    //添加到路由列表
    _groups.addAll(routerPageProvider);
  }

  ///跳转路由地址对应的页面并传递参数
  static void pushRoute(String path,{dynamic params}){
    Widget page = getPage(path);
    if(page == null){
      throw Exception("${path}:该路由不存在！！！");
    }
    pushWidgetRoute(page, params: params);
  }

  ///跳转页面并携带参数
  static void pushWidgetRoute(Widget page,{dynamic params}){
    //存储参数
    _paramsStorage.addAll({page.hashCode: params});
  }

  ///通过路由地址获取页面并跳转 TODO 增加判断，如果没获取到，则遍历整个map进行查找。
  static Widget getPage(String path){
    MNRouterCreatePage pageCreater = _groups[path];
    if(pageCreater != null){
      return pageCreater();
    }
    return null;
  }

  ///判断是否存在路由
  static bool hasPage(String path){
    return _groups.containsKey(path);
  }

  ///通过页面对象获取跳转时传递的参数对象
  static Widget getParamsForWidget(Widget pageObj){
    //通过pageObj的hashCode作为关键字！
    _paramsStorage[pageObj.hashCode];
  }
}