# 简介

一个以注解方式实现的路由映射解决方案，基于 source_gen

# 使用

1. **注意**: 你的页面应该实现指定的构造器，一个接受唯一参数的构造器，然后使用@MNRoute 注解你的页面类
   例：

   ```Dart
   @MNRoute(path: '/module/pagePath')
   class A {
    A(MyRouteOption option): super();
   }
   ```

2. 使用 **@MNRouteRoot** 注解 **你自己**的 router 类
   例：

   ```Dart
   @MNRouteRoot()
   class MyRouter {}
   ```

3. 在你的工作目录下运行 build_annotation_route.sh 脚本，或者运行如下命令:  
   build:

   ```shell
    flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

   建议在执行 build 命令前，先执行如下命令:  
    clean:

   ```shell
    flutter packages pub run build_runner clean
   ```

4. 现在你可以使用它来获取类的实例了  
   例：

   ```Dart
   @MNRouteRoot()
   class Router {
    MNRouterInternal internal = MNRouterInternalImpl();
    dynamic getPage(MyRouteOption option) {
      return internal.findPage(
          MNRouteOption(option.pathPattern, option.params), option);
    }
   }

   class MyRouteOption {
    String pathPattern;
    Map<String, dynamic> params;
   }
   ```

5. 具体代码可以参考 lib/example/\*下的文件

# 安装

## 从 pub 安装

在你的 pubspec.yaml 文件下声明  
例：

```yaml
dev_dependencies:
  manniu_router:
    git:
      url: git@10.241.65.201:flutter/manniu-pub/manniu-router.git
      ref: 022
```

## 从源码安装

拷贝代码至你的工作目录，在你的 pubspec.yaml 文件下声明  
例：

```yaml
dev_dependencies:
  manniu_router:
    path: ./manniu-router
```
