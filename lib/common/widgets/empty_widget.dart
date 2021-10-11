import 'package:flutter/material.dart';

/// 空widget
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 0,height: 0,);
  }
}
