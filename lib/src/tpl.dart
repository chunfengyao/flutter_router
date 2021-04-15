const String clazzTpl = """
import 'dart:convert';
import 'package:annotation_route/route.dart';
{{#refs}}
import '{{{path}}}';
{{/refs}}

class MNRouterInternalImpl extends MNRouterInternal {
  MNRouterInternalImpl();
  static final Map<String, List<Map<String, dynamic>>> innerRouterMap = <String, List<Map<String, dynamic>>>{{{routerMap}}};

  @override
  bool hasPageConfig(MNRouteOption option) {
    final dynamic pageConfig = findPageConfig(option);
    return pageConfig != null;
  }

  @override
  MNRouterResult findPage(MNRouteOption option, dynamic initOption) {
    final dynamic pageConfig = findPageConfig(option);
    if(pageConfig != null) {
      return implFromPageConfig(pageConfig, initOption);
    } else {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
  }

  static void instanceCreated(dynamic clazzInstance, Map<String, dynamic> pageConfig) {
    {{{instanceCreated}}}
  }

  static dynamic instanceFromClazz(Type clazz, dynamic option) {
    {{{instanceFromClazz}}}
  }

  static MNRouterResult implFromPageConfig(Map<String, dynamic> pageConfig, dynamic option) {
    final String interceptor = pageConfig['interceptor'];
    if(interceptor != null) {
      return MNRouterResult(state: MNRouterResultState.REDIRECT, interceptor: interceptor);
    }
    final Type clazz = pageConfig['clazz'];
    if (clazz == null) {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
    try {
      final dynamic clazzInstance = instanceFromClazz(clazz, option);
      instanceCreated(clazzInstance, pageConfig);
      return MNRouterResult(widget: clazzInstance, state: MNRouterResultState.FOUND);
    } catch (e) {
      return MNRouterResult(state: MNRouterResultState.NOT_FOUND);
    }
  }

  static dynamic findPageConfig(MNRouteOption option) {
    final List<Map<String, dynamic>> pageConfigList = innerRouterMap[option.pathPattern];
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
""";

const String instanceCreatedTpl = """
""";
