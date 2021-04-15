
import 'package:build/build.dart';
import 'package:flutter/widgets.dart';

typedef FindPageFunc = Widget Function(String path);
typedef PushRouteFunc = void Function(Widget widget);
class MNRouter{
  static Map<String, FindPageFunc> _groups;
  static Map<int, dynamic> _paramsStorage;
  static final MNRouter _INSTANCE = MNRouter();
  static PushRouteFunc _pushRouteFunc;
  get Instance => _INSTANCE;

  //注册路由跳转功能
  static void init(PushRouteFunc pushRouteFunc){
    _pushRouteFunc = pushRouteFunc;
  }

  ///初始化路由（将子模块的路由传递给管理类，并且提供找页面的功能。）
  void addGroup(String groupName, FindPageFunc findPage){
    //如果groupName已经存在，则直接报错！！！
    if(_groups.containsKey(groupName)) {
      throw Exception("${groupName}:该路由已经存在了！！！");
    }
    //添加到路由列表
    _groups.addAll({groupName: findPage});
  }

  ///获取页面并跳转
  void pushRoute(String path,{dynamic params}){
    Widget page = getPage(path);
    if(page == null){
      throw Exception("${path}:该路由不存在！！！");
    }
    //存储参数
    _paramsStorage.addAll({page.hashCode: params});
  }

  ///跳转页面
  void pushWidgetRoute(Widget page,{dynamic params}){

  }

  ///获取页面并跳转
  Widget getPage(String path){

  }

  ///通过页面对象获取跳转时传递的参数对象
  dynamic getParamsForPage(Widget pageObj){
    //通过pageObj的hashCode作为关键字！
    _paramsStorage[pageObj.hashCode];
  }

}