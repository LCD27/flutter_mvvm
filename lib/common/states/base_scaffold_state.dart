//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import 'base_state.dart';
//
// abstract class CDBaseScaffoldState<T extends StatefulWidget> extends CDBaseState{
//
//   @protected
//   bool get isShowAppBar => true;
//
//   bool get isExitApp => false;//双击返回桌面
//
//   bool get isNoPop => false;//禁止返回
//   DateTime? _clickTime;//返回键时间间隔
//
//
//   /// 双击及禁止返回退出方法
//   Future<bool> _onWillPop() {
//     if (isNoPop) {
//       return Future.value(false);
//     }
//     if (_clickTime != null && DateTime.now().difference(_clickTime!) < const Duration(seconds: 2)) {
//       return Future.value(true);
//     } else {
//       _clickTime = DateTime.now();
//       // ToastUtil.show(exitAppTips(context));
//       return Future.value(false);
//     }
//   }
//
//
//
//   // 脚手架属性配置
//   bool get resizeToAvoidBottomInset => true;
//
//   bool get extendBodyBehindAppBar => false;
//
//   bool get extendBody => false;
//
//   // 创建APP BAR
//   @protected
//   PreferredSizeWidget? buildAppBar(BuildContext context) {
//     return null;
//   }
//
//   // 创建底部导航
//   @protected
//   Widget buildNavigationBar(BuildContext context) {
//     return emptyUI;
//   }
//
//   // 创建悬浮按钮
//   @protected
//   Widget buildFloatingActionButton(BuildContext context) {
//     return emptyUI;
//   }
//
//   @protected
//   FloatingActionButtonLocation? buildFloatingActionButtonLocation(BuildContext context) {
//     return null;
//   }
//
//   @protected
//   FloatingActionButtonAnimator? buildFloatingActionButtonAnimator(BuildContext context) {
//     return null;
//   }
//
//   // 创建背景
//   Widget buildBg(BuildContext context){
//     return emptyUI;
//   }
//
//   Widget buildDrawer(BuildContext context) {
//     return emptyUI;
//   }
//
//   Widget buildEndDrawer(BuildContext context) {
//     return emptyUI;
//   }
//
//
//   double get drawerEdgeDragWidth => 20;
//
//   DragStartBehavior get drawerDragStartBehavior => DragStartBehavior.start;
//
//
//
//   Widget _buildScaffold(BuildContext context,) {
//     return Scaffold(
//       resizeToAvoidBottomInset: resizeToAvoidBottomInset,
//       appBar: buildAppBar(context),
//       body: buildBody(context),
//       bottomNavigationBar: buildNavigationBar(context),
//       extendBodyBehindAppBar: extendBodyBehindAppBar,
//       extendBody: extendBody,
//       drawer: buildDrawer(context),
//       endDrawer: buildEndDrawer(context),
//       drawerEdgeDragWidth: drawerEdgeDragWidth,
//       drawerDragStartBehavior: drawerDragStartBehavior,
//       floatingActionButton: buildFloatingActionButton(context),
//       floatingActionButtonLocation: buildFloatingActionButtonLocation(context),
//       floatingActionButtonAnimator: buildFloatingActionButtonAnimator(context),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isExitApp ? WillPopScope(child: _buildScaffold(context), onWillPop: _onWillPop) : _buildScaffold(context);
//   }
//
//   Widget buildBody(BuildContext context);
// }