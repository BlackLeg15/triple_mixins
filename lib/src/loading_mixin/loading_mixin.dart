import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get store;
  Widget get onStateWidget;
  Widget get onLoadingWidget => const Center(child: const CircularProgressIndicator());
  late Widget finalPageForLoadingMixin;

  @override
  void initState() {
    super.initState();
    finalPageForLoadingMixin = TripleBuilder(
      store: store,
      builder: (context, triple) => triple.isLoading ? onLoadingWidget : onStateWidget,
    );
  }
}
