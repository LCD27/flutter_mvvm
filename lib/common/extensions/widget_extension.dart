
import 'package:flutter/material.dart';
import 'num_extension.dart';
extension GapExtension on num{

  /// 横向间隔
  /// 使用方法为 [1.hGap]
  Widget get hGap => SizedBox(width: w);

  /// 纵向间隔
  /// 使用方法为 [1.vGap]
  Widget get vGap => SizedBox(height: w);

}

extension WidgetLineExtension on num{
  /// 横线
  /// [color] 线段颜色
  /// [margin] 线段间距 默认无
  /// [width] 线段宽度
  Widget hLine({
    Color? color,
    EdgeInsets margin = EdgeInsets.zero,
    double? width,
  }) =>
      Builder(builder: (context) {
        return Container(
          margin: margin,
          width: width??0.w,
          height: w,
          color: color ?? Colors.black12,
        );
      });

  /// 竖线
  /// [color] 线段颜色
  /// [margin] 线段间距 默认无
  /// [height] 线段高度
  Widget vLine({
    Color? color,
    EdgeInsets margin = EdgeInsets.zero,
    double? height,
  }) =>
      Builder(builder: (context) {
        return Container(
          margin: margin,
          width: w,
          height: height??0.w,
          color: color ??  Colors.black12,
        );
      });
}