import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

///
///
/// 路由器页面
///
///

class CDHandlerDefine {
  Handler handler;
  String routePath;

  CDHandlerDefine({
    required this.routePath,
    required this.handler,
  });
}
typedef CDHandlerFunc = Widget? Function(
    BuildContext? context, Object? parameters);
class CDHandler {
  static Handler handler({required CDHandlerFunc cdHandlerFunc}) {
    return Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters){
      return cdHandlerFunc(context,context?.settings?.arguments);
    });
  }
}
