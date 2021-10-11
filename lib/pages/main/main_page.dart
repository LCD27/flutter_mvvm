
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/common/index.dart';
import 'package:flutter_mvvm/common/router_config/routers.dart';
import 'package:flutter_mvvm/pages/main/widgets/main_item.dart';

class MainPageParams{

}

class MainPage extends StatefulWidget {
  final MainPageParams? params;
  const MainPage({Key? key, this.params}) : super(key: key);

  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends CDBaseState<MainPage> {

  List<String> data = ['测试'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
        ),
      body: ListView.builder(itemBuilder: (context,index){
        return MainItem(text: data[index],onTap: (){
          CDNavigator.push(context, CDRoutes.test);
        },);
      },itemCount: data.length,),
    );
  }
}
