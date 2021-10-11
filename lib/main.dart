import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/pages/splash_page.dart';
import 'package:flutter_mvvm/utils/index.dart';

import 'common/index.dart';
import 'pages/main/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    LogUtil.d('FlutterError');
    if (kReleaseMode) {

    }
    Zone.current.handleUncaughtError(
        details.exception,
        details.stack ??
            StackTrace.fromString(
                'the stack of FlutterErrorDetails is null'));
  };
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    LogUtil.d(' $error  $kReleaseMode', title: 'runZonedGuarded');
    // CDToast.toast('发生未知错误');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CDScreenUtilInit(builder: (){
      return FutureBuilder(
          future: Init.instance.initialize(context),
          builder: (context, AsyncSnapshot asyncSnapshot) {
            Widget? home;
            if (asyncSnapshot.connectionState == ConnectionState.done) {
              home = const MainPage();
            } else {
              home = const SplashPage();
            }
            return MaterialApp(
              theme: ThemeData(
                primaryColor: Colors.blueGrey,
                appBarTheme:  AppBarTheme(
                  elevation: 0,
                  titleTextStyle:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp),
                  toolbarTextStyle:  TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16.sp),
                  centerTitle: true,
                ),

              ),
              home: home,
              onGenerateRoute: Application.router.generator,
              navigatorObservers: [CDRouteObserver()],
            );
          });
    });
  }
}
/// 初始化
///
///
///
class Init {
  Init._();

  static final instance = Init._();

  // 初始化路由
  _initRoutes() {
    final router = FluroRouter();
    Application.router = router;
    CDRoutes.configureRoutes(router);
  }

  // 一些数据的初始化
  Future initialize(BuildContext context) async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    _initRoutes();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    ///屏幕刷新率和显示率不一致时的优化
    GestureBinding.instance?.resamplingEnabled = true;
    //禁止横屏 强制竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await CDSpUtil.getInstance();
  }
}
