import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin LoadingErrorMixin<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get tripleStore;
  Widget get onStateWidget;
  Widget get onLoadingWidget;
  Widget get onErrorWidget;
  late Widget finalPage;

  @override
  void initState() {
    super.initState();
    finalPage = TripleBuilder(
      store: tripleStore,
      builder: (context, triple) => triple.error != null
          ? onErrorWidget
          : triple.isLoading
              ? onLoadingWidget
              : onStateWidget,
    );
  }
}
