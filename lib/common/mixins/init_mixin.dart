import 'package:flutter/material.dart';

mixin InitStateMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initData(context);
    });
  }

  void initData(BuildContext context);
}
