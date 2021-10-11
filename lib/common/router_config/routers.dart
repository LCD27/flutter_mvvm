import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/pages/main/main_page.dart';
import 'package:flutter_mvvm/pages/test/test_page.dart';
import 'route_handlers.dart';
import '../../utils/index.dart';

///
/// 路由器管理中心
///
///
class CDRoutes {
  static String main = '/main';
  static String test = '/test';

  /// 添加页面路由管理
  static List<CDHandlerDefine> get _appRoutes => [
        CDHandlerDefine(
            routePath: main,
            handler: CDHandler.handler(cdHandlerFunc: (context, params) {
              /// 有参数
              MainPageParams? tmp = params  as MainPageParams;
              return  MainPage(params: tmp,);
            })),
        CDHandlerDefine(
            routePath: test,
            handler: CDHandler.handler(cdHandlerFunc: (context, params) {
              /// 无参数
              return const TestPage();
            })),
      ];

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      LogUtil.d('页面出错');
      return;
    });
    for (CDHandlerDefine element in _appRoutes) {
      router.define(element.routePath, handler: element.handler);
    }
  }
}
