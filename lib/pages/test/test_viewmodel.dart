

import 'package:flutter_mvvm/common/viewmodel/base_viewmodel.dart';
import 'package:flutter_mvvm/utils/index.dart';

///
/// 任何一切viewmodel 都需要继承BaseViewModel
///
class TestViewModel extends BaseViewModel{

  int _count = 10;

  addCount(){
    _count = _count+100;
    LogUtil.d('$_count');
    notifyListeners();
  }

  int get count => _count;
}