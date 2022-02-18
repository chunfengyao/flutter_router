import 'package:flutter/widgets.dart';
import 'package:manniu_router/src/router_function_define.dart';

/// <pre>
/// Used to 路由管理类
/// <pre/>
/// created by:   yaochunfeng
/// on:           2021/4/25 2:36 下午
/// Email:        yaochunfeng@wondersgroup.com

/// <pre>
/// 蛮牛路由管理类
/// <pre/>
class MNRouterManager {
  static final Map<String, MNRouterItem> _routerMap = {};
  @Deprecated("请使用options")
  static final Map<int, dynamic> _paramsStorage = {};

  ///往全局存储池中添加路由表
  static void addRouter(Map<String, MNRouterItem> routerPageProvider) {
    //如果groupName已经存在，则直接报错！！！
    //添加到路由列表
    _routerMap.addAll(routerPageProvider);
  }

  ///通过路径获取对应的页面对象（新的）。
  static Widget? getPage(String path) {
    var routeItem = _routerMap[path];
    if (routeItem != null) {
      return routeItem.creator();
    }
    return null;
  }

  ///获取当前页面对象的参数（可以重复调用，但是只有第一次会收到onValue回调）。
  ///onValue 会在有值的时候调用，没值的时候不会调用
  static void injectParams(
      Widget owner, void Function(dynamic params) onValue) {
    dynamic params = _getParamsForWidget(owner);
    if (params != null) {
      onValue(params);
    }
  }

  ///为指定页面对象替换或者添加params，params允许为空：效果为移除现有参数。
  @Deprecated("请使用options")
  static void putParams(Widget pageObj, dynamic params){
    if(pageObj == null){
      return;
    }
    _paramsStorage[pageObj.hashCode] = params;
  }

  ///只能获取一次，第二次为空
  @Deprecated("请使用options")
  static dynamic _getParamsForWidget(Widget pageObj) {
    //通过pageObj的hashCode作为关键字！
    return _paramsStorage.remove(pageObj.hashCode);
  }

  ///为指定路由对象或者添加全局属性值，属性值允许为空：效果为移除现有参数。
  static void putOptions(String routePath, Map<String, String?> options){
    if(routePath == null){
      return;
    }
    MNRouterItem? item = _routerMap[routePath];
    if(item != null){
      if(item.options == null){
        item.options = Map();
      }
      item.options!.addAll(options);
    }else{
      throw Exception("未从路由表中找到该路由:" + routePath);
    }
  }

  static Map<String, String?>? getOptionsForRoute(String routePath) {
    return _routerMap[routePath]?.options;
  }

  static void clearOptionsForRoute(String routePath) {
    _routerMap[routePath]?.options = null;
  }

  ///为指定路由对象或者添加标签。
  static void addTagsForRoute(String routePath, List<String> tags){

  }

  static void removeTagsForRoute(String routePath, List<String> tags) {
    for (var tag in tags) {
      _routerMap[routePath]?.tags?.remove(tag);
    }
  }

  static void clearTagsForRoute(String routePath) {
    _routerMap[routePath]?.tags = null;
  }

}