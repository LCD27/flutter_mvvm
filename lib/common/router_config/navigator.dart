import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'application.dart';

class CDNavigator {
  /// 路由跳转
  ///
  /// [context] 上下文
  /// [path] 路由名
  /// [router] fluro 路由
  /// [params] 携带参数
  /// [routeSettings] 路由设置，设置该参数时，params参数无效
  /// [replace] 替换
  /// [clearStack] 清空路由
  /// [transition] 动画type
  /// [transitionBuilder] 自定义动画
  static push(BuildContext context, String path,
      {Object? params,
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType transition = TransitionType.cupertino,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    Application.router.navigateTo(context, path,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionBuilder: transitionBuilder,
        routeSettings:
            routeSettings ?? RouteSettings(name: path, arguments: params));
  }

  /// 是否允许返回
  ///
  /// [context] 上下文
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  /// 返回
  ///
  /// [context] 上下文
  /// [result] 返回参数
  /// Similar to [Navigator.pop]
  static void pop<T>(BuildContext context, [T? result]) =>
      Navigator.of(context).pop(result);

  /// 栈顶路由逐个出栈，直至predicate指定的条件
  /// 当前路由顺序为A-B-C-D-E
  /// 在E popUntil(context,Module.withName('B'))，withName内的名字可以是为路由注册的名字，或是为路由设置的RouteSetting。
  /// 方法的返回值是false，那么删除新页面之前的所有路由
  /// 那么路由顺序为：A-B
  static popUtil(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) {
      // ModalRoute.withName(root);
      bool isRoot = route.settings.name == path;
      return isRoot;
    });
  }
}
