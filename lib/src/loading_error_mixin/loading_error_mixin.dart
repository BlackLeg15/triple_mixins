import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

/// Let a class for Error E
/// A mixin that gather the function of [LoadingMixin] and [ErrorMixin]
/// in only one mixin. By default, the error state has priority over
/// the loading state, which has priority over the normal flow of the app.
mixin LoadingErrorMixin<T extends StatefulWidget> on State<T> {
  ///The triple store that controls this flow
  Store<Object, Object> get tripleStore;

  ///The widget that will be showed when a loading/error state is not happening
  Widget get onStateWidget;

  ///If not error, this widget will be showed when a loading state is happening
  ///i.e. after a setLoading(true)
  Widget get onLoadingWidget;

  ///The widget that will be showed when the error is happening i.e. setError(E())
  Widget get onErrorWidget;

  ///The widget that will be always showed to the user. The build method of the State
  ///of a StatefulBuilder returns it.
  ///The passed Store object is read by a TripleBuilder that returns the properly widget
  ///based on the state (Error/Loading/State, in this order of priority) that's happening
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
