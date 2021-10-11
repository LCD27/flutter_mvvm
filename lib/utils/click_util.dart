
class ClickUtil {
  //时间间隔
  static late DateTime _lastClickTime;

  // 某一时间内不可点击
  static bool enableClick({int timeInterval = 800}) {
    DateTime now = DateTime.now();
    if (_compareDate(_lastClickTime, now, timeInterval)) {
      _lastClickTime = now;
      return true;
    } else {
      return false;
    }
  }

  // toTime 大时间 fromTime 小时间
  static bool _compareDate(DateTime fromTime, DateTime toTime, int milliseconds) {
    if (fromTime == null || toTime == null) {
      _lastClickTime = toTime;
      return true;
    }
    int diffSeconds = toTime.difference(fromTime).inMilliseconds;
    if (diffSeconds > milliseconds) {
      return true;
    } else {
      return false;
    }
  }
}
