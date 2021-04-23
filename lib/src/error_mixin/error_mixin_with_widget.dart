import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin ErrorMixinWithWidget<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get tripleStore;
  Widget get onStateWidgetForErrorMixin;
  Widget get onErrorWidgetForErrorMixin;
  late Widget finalPageForErrorMixin;

  @override
  void initState() {
    super.initState();
    finalPageForErrorMixin = TripleBuilder(
      store: tripleStore,
      builder: (context, triple) => triple.error != null ? onErrorWidgetForErrorMixin : onStateWidgetForErrorMixin,
    );
  }
}
