import 'package:flutter/material.dart';

import 'text_util.dart';

class MatchUtil {
  static const String _REGEX_MOBILE = "^(1[3-9][0-9])\\d{8}"; //手机号校验规则
  static const String _REGEX_TEL = "^([0]{1}\\d{2,3}-)|([(]?[（]?([0]{1}\\d{2,3})?[)]?[）]?[-]?)\\d{7,8}"; //电话号码校验规则
  static const String _REGEX_EMAIL = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"; //邮箱
  static const String _REGEX_TENCENT_QQ = "[1-9][0-9]{4,10}"; //腾讯QQ
  static const String _REGEX_ZIP_CODE = "[0-9]\\d{5}(?!\\d)"; //中国邮政编码
  static const String _REGEX_CHINESE_NAME = "^[\\u4e00-\\u9fa5]+"; // 中文名称
  static const String _REGEX_CHINESE_NAME_FEW = "^[\\u4e00-\\u9fa5]+[·•][\\u4e00-\\u9fa5]+"; //少数民族中文名称
  static const String _REGEX_URL = r'(?=.*[.])((https?|ftp|file):\/\/)?[-A-Za-z0-9+&@#/%?=~_|!:,;.]+[-A-Za-z0-9+&@#/%=~_|]'; //网址规则精准校验

  /// 正则校验
  ///
  /// [regex] 正则表达式
  /// [input] 校验字符串
  static bool isMatch({ String? regex,  String? input}) {
    return regex != null && input != null && input.length > 0 && RegExp(regex).hasMatch(input);
  }

  /// 手机号校验
  ///
  /// [mobile] 手机号
  /// [regex] 校验正则，选填
  static bool isMobile(String mobile, {String? regex}) {
    return mobile.length == 11 && isMatch(regex: regex ?? _REGEX_MOBILE, input: mobile);
  }

  /// 电话号码校验
  ///
  /// [tel] 电话号码
  /// [regex] 校验正则，选填
  static bool isTel(String tel, {String? regex}) {
    return isMatch(regex: regex ?? _REGEX_TEL, input: tel);
  }

  /// 邮箱校验
  ///
  /// [email] 邮箱
  /// [regex] 校验正则，选填
  static bool isEmail(String email, {String? regex}) {
    return isMatch(regex: regex ?? _REGEX_EMAIL, input: email);
  }

  /// QQ校验
  ///
  /// [qq] qq
  /// [regex] 校验正则，选填
  static bool isQQ(String qq, {String? regex}) {
    return isMatch(regex: regex ?? _REGEX_TENCENT_QQ, input: qq);
  }

  /// 中国邮政编码校验
  ///
  /// [zipCode] 中国邮政编码
  /// [regex] 校验正则，选填
  static bool isZipCode(String zipCode, {String? regex}) {
    return isMatch(regex: regex ?? _REGEX_ZIP_CODE, input: zipCode);
  }

  /// 中文名称校验
  ///
  /// [name] 中文名称
  static bool isChineseName(String name) {
    if (name.contains('·') || name.contains("•")) {
      return isMatch(regex: _REGEX_CHINESE_NAME_FEW, input: name);
    }
    return isMatch(regex: _REGEX_CHINESE_NAME, input: name);
  }

  /// url校验
  ///
  /// [url] 网址链接
  /// [regex] 校验正则，选填
  static bool isUrl(String url, {String ?regex}) {
    return isMatch(regex: regex ?? _REGEX_URL, input: url);
  }

  /// http校验
  ///
  /// [http] http开头的网址链接
  static bool isHttp(String http) {
    if (TextUtil.isEmpty(http)) return false;
    return http.startsWith('http') || http.startsWith('https');
  }

  /// 密码校验
  ///
  /// [password] 密码
  /// [regex] 校验正则，选填
  /// [min] 最小位数，选填
  /// [max] 最大位数，选填
  static bool isPassword(String password, {required String regex, int? min, int? max}) {
    if (TextUtil.isEmpty(regex)) {
      regex = '^[A-za-z0-9]';
    }
    if (min != null && max != null) {
      if (min < 0 || min > max) {
        return false;
      }
      regex += '{$min,$max}';
    }
    return isMatch(regex: regex, input: password);
  }

  /// 包含中文校验
  ///
  /// [text] 字符串
  static bool isContainsChinese(String text) {
    return isMatch(regex: "[\\u4E00-\\u9FA5]+", input: text);
  }

  /// 包含字母校验
  ///
  /// [text] 字符串
  static bool isContainsLetter(String text) {
    return isMatch(regex: '.*[a-zA-Z]+.*', input: text);
  }

  /// 整数校验
  ///
  /// [text] 字符串
  static bool isInteger(String text) {
    return isMatch(regex: r"^[0-9]+$", input: text);
  }

  /// 验证是否正确身份证
  ///
  /// [idCard] 身份证
  static bool isIdCard(String idCard) {
    String ai = '';
    //传入不能为空
    if (idCard == null || idCard.trim().isEmpty) {
      return false;
    }
    // 判断号码的长度 15位或18位
    if (idCard.length != 15 && idCard.length != 18) {
      //"身份证号码长度应该为15位或18位。";
      return false;
    }
    // 18位身份证前17位位数字，如果是15位的身份证则所有号码都为数字
    if (idCard.length == 18) {
      ai = idCard.substring(0, 17);
    } else {
      ai = idCard.substring(0, 6) + "19" + idCard.substring(6, 15);
    }
    if (!isInteger(ai)) {
      //"身份证15位号码都应为数字 ; 18位号码除最后一位外，都应为数字。";
      return false;
    }
    // 判断出生年月是否有效
    String strYear = ai.substring(6, 10); // 年份
    String strMonth = ai.substring(10, 12); // 月份
    String strDay = ai.substring(12, 14); // 日期
    if (!_isDate(strYear + "-" + strMonth + "-" + strDay)) {
      //"身份证出生日期无效。";
      return false;
    }
    DateTime dateTime = DateTime.now();
    DateTime idCardDate = DateTime(int.parse(strYear), int.parse(strMonth), int.parse(strDay));
    int time = idCardDate.millisecond;
    if (dateTime.year - int.parse(strYear) > 150 || dateTime.millisecond - time < 0) {
      //"身份证生日不在有效范围。";
      return false;
    }
    if (int.parse(strMonth) > 12 || int.parse(strMonth) <= 0) {
      //"身份证月份无效";
      return false;
    }
    if (int.parse(strDay) > 31 || int.parse(strDay) <= 0) {
      //"身份证日期无效";
      return false;
    }
    // 判断地区码是否有效
    if (!_getAreaCode().containsKey(ai.substring(0, 2))) {
      // 如果身份证前两位的地区码不在Map，则地区码有误
      return false;
    }

    return _isVerifyCode(ai, idCard);
  }

  static bool _isVerifyCode(String ai, String idCard) {
    //判断第18位校验码是否正确 第18位校验码的计算方式： 1. 对前17位数字本体码加权求和 公式为：S = Sum(Ai * Wi), i =
    //0, ... , 16 其中Ai表示第i个位置上的身份证号码数字值，Wi表示第i位置上的加权因子，其各位对应的值依次为： 7 9 10 5 8 4
    //2 1 6 3 7 9 10 5 8 4 2 2. 用11对计算结果取模 Y = mod(S, 11) 3. 根据模的值得到对应的校验码
    //对应关系为： Y值： 0 1 2 3 4 5 6 7 8 9 10 校验码： 1 0 X 9 8 7 6 5 4 3 2
    List<String> verifyCode = ["1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"];
    List<String> wi = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"];
    int sum = 0;
    for (int i = 0; i < 17; i++) {
      sum = sum + int.parse(ai[i]) * int.parse(wi[i]);
    }
    int modValue = sum % 11;
    String strVerifyCode = verifyCode[modValue];
    ai = ai + strVerifyCode;
    if (idCard.length == 18 && ai != idCard) {
      return false;
    }
    return true;
  }

  static Map<String, String> _getAreaCode() {
    //将所有地址编码保存在一个Map中
    Map<String, String> areaCodeMap = {};
    areaCodeMap["11"] = "北京";
    areaCodeMap["12"] = "天津";
    areaCodeMap["13"] = "河北";
    areaCodeMap["14"] = "山西";
    areaCodeMap["15"] = "内蒙古";
    areaCodeMap["21"] = "辽宁";
    areaCodeMap["22"] = "吉林";
    areaCodeMap["23"] = "黑龙江";
    areaCodeMap["31"] = "上海";
    areaCodeMap["32"] = "江苏";
    areaCodeMap["33"] = "浙江";
    areaCodeMap["34"] = "安徽";
    areaCodeMap["35"] = "福建";
    areaCodeMap["36"] = "江西";
    areaCodeMap["37"] = "山东";
    areaCodeMap["41"] = "河南";
    areaCodeMap["42"] = "湖北";
    areaCodeMap["43"] = "湖南";
    areaCodeMap["44"] = "广东";
    areaCodeMap["45"] = "广西";
    areaCodeMap["46"] = "海南";
    areaCodeMap["50"] = "重庆";
    areaCodeMap["51"] = "四川";
    areaCodeMap["52"] = "贵州";
    areaCodeMap["53"] = "云南";
    areaCodeMap["54"] = "西藏";
    areaCodeMap["61"] = "陕西";
    areaCodeMap["62"] = "甘肃";
    areaCodeMap["63"] = "青海";
    areaCodeMap["64"] = "宁夏";
    areaCodeMap["65"] = "新疆";
    areaCodeMap["71"] = "台湾";
    areaCodeMap["81"] = "香港";
    areaCodeMap["82"] = "澳门";
    areaCodeMap["91"] = "国外";
    return areaCodeMap;
  }

  static bool _isDate(String date) {
    //判断日期是否正确
    return isMatch(
        regex: "^((([0-9]{2})(0[48]|[2468][048]|[13579][26]))" //闰年，能被4整除但不能被100整除
            +
            "|((0[48]|[2468][048]|[13579][26])00)" //闰年，能被400整除
            +
            "-02-29)" //匹配闰年2月29日这一天。如果不是这一天，则由下面式子继续匹配验证。
            +
            "|([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})" //平年（0001-9999）
            +
            "-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))" //月日，1、3、5、7、8、10、12月有31天
            +
            "|((0[469]|11)-(0[1-9]|[12][0-9]|30))" //月日，4、6、9、11月有30天
            +
            "|(02-(0[1-9]|[1][0-9]|2[0-8])))", //平年2月只有28天，月日表示为【02-01至02-28】
        input: date);
  }
}
