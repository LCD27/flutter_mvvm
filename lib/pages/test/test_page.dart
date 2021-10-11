import 'package:flutter/material.dart';
import 'package:flutter_mvvm/common/states/base_state.dart';
import 'package:flutter_mvvm/common/widgets/base_provider_widget.dart';
import 'package:flutter_mvvm/pages/test/test_viewmodel.dart';
import 'package:flutter_mvvm/utils/index.dart';
import 'package:provider/provider.dart';

class TestPageParams {
  String? test;

  TestPageParams({this.test});
}

class TestPage extends StatefulWidget {
  final TestPageParams? params;

  const TestPage({Key? key, this.params}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends CDBaseState<TestPage> {
  @override
  Widget build(BuildContext context) {
    return BaseProviderWidget<TestViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: Center(
            child: Text('${value.count}'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              LogUtil.d('floatingActionButton');
              Provider.of<TestViewModel>(context, listen: false)
                  .addCount();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
      model: TestViewModel(),
    );
  }
}
