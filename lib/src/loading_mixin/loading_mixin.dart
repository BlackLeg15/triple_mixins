import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get tripleStore;
  Widget get onStateWidgetForLoadingMixin;
  Widget get onLoadingWidgetForLoadingMixin;
  late Widget finalPageForLoadingMixin;

  @override
  void initState() {
    super.initState();
    finalPageForLoadingMixin = TripleBuilder(
      store: tripleStore,
      builder: (context, triple) => triple.isLoading ? onLoadingWidgetForLoadingMixin : onStateWidgetForLoadingMixin,
    );
  }
}
