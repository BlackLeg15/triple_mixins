import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin ErrorMixinWithWidget<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get store;
  Widget get onStateWidget;
  Widget Function(Object error) get onErrorWidget;
  late Widget finalPageForErrorMixin;

  @override
  void initState() {
    super.initState();
    finalPageForErrorMixin = TripleBuilder(
      store: store,
      builder: (context, triple) => triple.error != null ? onErrorWidget(triple.error!) : onStateWidget,
    );
  }
}