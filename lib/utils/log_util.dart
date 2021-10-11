import 'package:flutter/foundation.dart';

class LogUtil {
  static final _isDebug = !kReleaseMode;
  static const int _limitLength = 500;
  static String _title = '';
  static void d(dynamic obj,{String? title}) {
    _title = title??'';
    if (_isDebug) {
      _log(obj.toString());
    }
  }
  static void _log(String msg) {
    // print("$_startLine");
    _logStartLine();
    _logEmptyLine();

    if (msg.length < _limitLength) {
      print(msg);
    } else {
      segmentationLog(msg);
    }
    _logEmptyLine();
    _logEndLine();
    // print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          var remainderStr = msg.substring(lastIndex, msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logStartLine() {
    print("=================  $_title start  =================");
  }
  static void _logEndLine() {
    print("=================  $_title  end   =================");
  }
  static void _logEmptyLine() {
    print("");
  }
}
