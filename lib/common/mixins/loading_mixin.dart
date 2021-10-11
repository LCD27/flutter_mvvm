import 'package:flutter/material.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  void showLoading({
    String msg = '',
    bool backEnabled = false,
    Widget icon = const SizedBox(),
    Color? backgroundColor,
  }) {
    //todo
  }

  void hideLoading(){

  }

  @override
  void dispose(){
    hideLoading();
    super.dispose();
  }
}
