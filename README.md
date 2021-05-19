# 简介

一个以注解方式实现的路由映射解决方案，基于 source_gen

# 使用

1. **注意**: 你的页面应该实现构造器，然后使用@MNRoute 注解你的页面类，并且填入路由地址（建议通过Constant类引用，避免使用魔法值）。
   例：

   ```Dart
   @MNRoute('/demo/pagePath')
   class A {
    A(): super();
   }
   ```

2. 使用 **@MNRouteRoot** 注解 模块的入口类
   例：

   ```Dart
   @MNRouteRoot()
   class ModuleRoot {}
   ```

3. 在你的工作目录下运行如下命令:
   build:

   ```shell
    flutter packages pub run build_runner build
   ```
   如果退出码为78并且提示`--delete-conflicting-outputs`，请运行如下命令。
   build:

   ```shell
    flutter packages pub run build_runner build --delete-conflicting-outputs
   ```
   如果是使用蛮牛的快捷指令，请记得添加build_runner的依赖（pubspec.yaml的dev_dependencies中）

4. 现在你可以使用它来进行路由管理了
   例：

   ```Dart
  static Widget getPage(String path){
    MNRouterCreatePage pageCreater = _routerMap[path];
    if(pageCreater != null){
      return pageCreater();
    }
    return null;
  }
  ///onValue 会在有值的时候调用，没值的时候不会调用
  static void injectParams(Widget owner, void Function(dynamic params) onValue){
    dynamic params = _getParamsForWidget(owner);
    if(params != null){
      onValue(params);
    }
  }

  ///只能获取一次，第二次为空
  static dynamic _getParamsForWidget(Widget pageObj){
    //通过pageObj的hashCode作为关键字！
    return _paramsStorage.remove(pageObj.hashCode);
  }
   ```
   将上述生成的路由表。`_routerMap_`包装注册给App的`onGenerateRoute: PbRouterConfig.generator`

5. 具体代码可以参考 lib/example/\*下的文件

# 安装

## 从 pub 安装

在你的 pubspec.yaml 文件下声明  
例：

```yaml
dev_dependencies:
  #强烈建议加在dev_dependencies中！！！
  manniu_router:
    git:
      url: 'git@10.241.65.201:flutter/manniu-pub/manniu-router.git'
      ref: 'master'
```

## 从源码安装

拷贝代码至你的工作目录。
或者在你的 pubspec.yaml 文件下声明。
例：

```yaml
dependencies:
  manniu_router:
    path: ./manniu-router

dev_dependencies:
  #这边需要声明build_runner才可以跑代码生成器。
  build_runner:
```
