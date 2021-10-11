import 'package:flutter/material.dart';
import '../mixins/loading_mixin.dart';

/// setState全局解决mounted问题
abstract class CDBaseState<T extends StatefulWidget> extends State<T>with  LoadingMixin {


  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  /// 关闭键盘
  void closeKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Widget get emptyUI => const SizedBox(width: 0,height: 0,);

}