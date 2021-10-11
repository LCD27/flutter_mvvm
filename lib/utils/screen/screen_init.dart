import 'package:flutter/material.dart';
import 'screen_util.dart';
class CDScreenUtilInit extends StatelessWidget {
  /// A helper widget that initializes [CDScreenUtil]
  const CDScreenUtilInit({
    required this.builder,
    this.designSize = CDScreenUtil.defaultSize,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      if (constraints.maxWidth != 0 &&
          constraints.maxWidth < constraints.maxHeight) {
        CDScreenUtil.init(
          constraints,
          // orientation: orientation,
          designSize: designSize,
        );
      }
      if (constraints.maxWidth == 0) {
        return Container();
      }
      return builder();
    });
  }
}
