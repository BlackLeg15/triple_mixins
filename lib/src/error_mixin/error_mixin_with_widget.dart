import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

/// Let a class for Error E
/// A mixin used to stablish a contract about showing a widget of error
/// when the state of error is happening. By default, the error state
/// has priority over the normal flow of the app. Thus, if a setError(E())
/// happens, even if have had an update(S()), the widget of error will not give
/// place to the normal flow of the app.
mixin ErrorMixinWithWidget<T extends StatefulWidget> on State<T> {
  ///The triple store that controls this flow
  Store<Object, Object> get tripleStore;

  ///The widget that will be showed when the state of error is not happening
  Widget get onStateWidgetWhenNotError;

  ///The widget that will be showed when the error is happening i.e. setError(E())
  Widget get onErrorWidget;

  ///The widget that will be always showed to the user. The build method of the State
  ///of a StatefulBuilder returns it.
  ///The passed Store object is read by a TripleBuilder that returns the properly widget
  ///based on the state (only Error/not Error) that's happening
  late Widget finalPageForErrorMixin;

  @override
  void initState() {
    super.initState();
    finalPageForErrorMixin = TripleBuilder(
      store: tripleStore,
      builder: (context, triple) => triple.error != null ? onErrorWidget : onStateWidgetWhenNotError,
    );
  }
}
