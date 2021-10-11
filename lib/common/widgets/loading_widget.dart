import 'package:flutter/material.dart';
import '../../common/index.dart';
enum LoadingType{
  circle,
}
class Loading extends StatelessWidget {
  final LoadingType? type;
  const Loading({Key? key, this.type = LoadingType.circle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.w,
      color: Colors.blueGrey,
      child: const Text('loading...'),
    );
  }
}
