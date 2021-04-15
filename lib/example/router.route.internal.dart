// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteWriterGenerator
// **************************************************************************

import 'dart:convert';
import 'package:annotation_route/route.dart';
import 'package:annotation_route/example/page_a.dart';
import 'package:annotation_route/example/page_d.dart';
import 'package:annotation_route/example/page_c.dart';
import 'package:annotation_route/example/page_b.dart';

class ARouterInternalImpl extends MNRouterInternal {
  ARouterInternalImpl();
  final Map<String, List<Map<String, dynamic>>> innerRouterMap =
      <String, List<Map<String, dynamic>>>{
    'myapp://pagea': [
      {'clazz': A}
    ],
    'myapp://paged': [
      {'clazz': D, 'params': '{"parama":"d"}'}
    ],
    'myapp://pagec': [
      {'clazz': C}
    ],
    'myapp://pagec_alias': [
      {'clazz': C}
    ],
    'myapp://pageb': [
      {'clazz': B, 'params': '{"parama":"b"}'}
    ]
  };

  @override
  bool hasPageConfig(MNRouteOption option) {
    final dynamic pageConfig = findPageConfig(option);
    return pageConfig != null;
  }

  @override
  MNRouterResult findPage(MNRouteOption option, dynamic initOption) {
    final dynamic pageConfig = findPageConfig(option);
    if (pageConfig != null) {
      return implFromPageConfig(pageConfig, initOption);
    } else {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
  }

  void instanceCreated(
      dynamic clazzInstance, Map<String, dynamic> pageConfig) {}

  dynamic instanceFromClazz(Type clazz, dynamic option) {
    switch (clazz) {
      case A:
        return new A(option);
      case D:
        return new D(option);
      case C:
        return new C(option);
      case B:
        return new B(option);
      default:
        return null;
    }
  }

  MNRouterResult implFromPageConfig(
      Map<String, dynamic> pageConfig, dynamic option) {
    final String interceptor = pageConfig['interceptor'];
    if (interceptor != null) {
      return MNRouterResult(
          state: MNRouterResultState.REDIRECT, interceptor: interceptor);
    }
    final Type clazz = pageConfig['clazz'];
    if (clazz == null) {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
    try {
      final dynamic clazzInstance = instanceFromClazz(clazz, option);
      instanceCreated(clazzInstance, pageConfig);
      return MNRouterResult(
          widget: clazzInstance, state: MNRouterResultState.FOUND);
    } catch (e) {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
  }

  dynamic findPageConfig(MNRouteOption option) {
    final List<Map<String, dynamic>> pageConfigList =
        innerRouterMap[option.pathPattern];
    if (null != pageConfigList) {
      for (int i = 0; i < pageConfigList.length; i++) {
        final Map<String, dynamic> pageConfig = pageConfigList[i];
        final String paramsString = pageConfig['params'];
        if (null != paramsString) {
          Map<String, dynamic> params;
          try {
            params = json.decode(paramsString);
          } catch (e) {
            print('not found A{pageConfig};');
          }
          if (null != params) {
            bool match = true;
            final Function matchParams = (String k, dynamic v) {
              if (params[k] != option?.params[k]) {
                match = false;
                print('not match:A{params[k]}:A{option?.params[k]}');
              }
            };
            params.forEach(matchParams);
            if (match) {
              return pageConfig;
            }
          } else {
            print('ERROR: in parsing paramsA{pageConfig}');
          }
        } else {
          return pageConfig;
        }
      }
    }
    return null;
  }
}
