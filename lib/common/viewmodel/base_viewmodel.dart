import 'package:flutter/material.dart';

import '../states/base_state_type.dart';

///
/// 任何一切viewmodel 都需要继承BaseViewModel
///

class BaseViewModel extends ChangeNotifier {
  BaseStateType? baseState;
}
