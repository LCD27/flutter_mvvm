import 'package:flutter/material.dart';
import '../viewmodel/base_viewmodel.dart';
import 'package:provider/provider.dart';

///
/// BaseProviderWidget 基于provider，ChangeNotifier 构造一个mvvm的widget
///
///
class BaseProviderWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(
      BuildContext context,
      T value,
      Widget? child,
      ) builder;
  final T model;
  final Widget? child;
  final Function(T value)? onModelReady;

  const BaseProviderWidget(
      {Key? key,
      required this.builder,
      required this.model,
      this.child,
      this.onModelReady})
      : super(key: key);

  @override
  _BaseProviderWidgetState<T> createState() => _BaseProviderWidgetState<T>();
}

class _BaseProviderWidgetState<T extends BaseViewModel>
    extends State<BaseProviderWidget<T>> {
  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

///
/// BaseProviderWidget2 基于provider，ChangeNotifier 构造一个mvvm的widget
///
///
class BaseProviderWidget2<A extends BaseViewModel, B extends BaseViewModel>
    extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    A value,
    B value2,
    Widget? child,
  ) builder;
  final A modelA;
  final B modelB;
  final Widget? child;
  final Function(A model1, B model2)? onModelReady;

  const BaseProviderWidget2({
    Key? key,
    required this.builder,
    required this.modelA,
    required this.modelB,
    this.child, this.onModelReady,
  }) : super(key: key);

  @override
  _BaseProviderWidget2State<A,B> createState() => _BaseProviderWidget2State<A,B>();
}

class _BaseProviderWidget2State<A extends BaseViewModel,
    B extends BaseViewModel> extends State<BaseProviderWidget2<A, B>> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<A>(create: (_)=>widget.modelA,),
          ChangeNotifierProvider<B>(create: (_)=>widget.modelB,),
        ],
        child: Consumer2<A, B>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
