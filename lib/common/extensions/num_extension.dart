
import '../../utils/index.dart';

extension NumExtension on num {
  ///[CDScreenUtil.setWidth]
  double get w => CDScreenUtil().setWidth(this);

  ///[CDScreenUtil.setHeight]
  double get h => CDScreenUtil().setHeight(this);

  ///[CDScreenUtil.radius]
  double get r => CDScreenUtil().radius(this);

  ///[CDScreenUtil.setSp]
  double get sp => CDScreenUtil().setSp(this);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => CDScreenUtil().screenWidth * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh => CDScreenUtil().screenHeight * this;
}