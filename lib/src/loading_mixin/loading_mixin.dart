import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

/// A mixin used to stablish a contract about showing a widget of loading
/// when the state of loading is happening. By default, the loading state
/// has priority over the normal flow of the app. Thus, if a setLoading(true)
/// happens, even if have had an update(), the widget of loading will only
/// give place to the normal flow when setLoading(false) has happened.
mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  ///The triple store that controls this flow
  Store<Object, Object> get tripleStore;

  ///The widget that will be showed when a loading state is not happening
  ///i.e. after a setLoading(false) or at the initial state
  Widget get onStateWidgetWhenNotLoading;

  ///The widget that will be showed when a loading state is happening
  ///i.e. after a setLoading(true)
  Widget get onLoadingWidget;

  ///The widget that will be always showed to the user. The build method of the State
  ///of a StatefulBuilder returns it.
  ///The passed Store object is read by a TripleBuilder that returns the properly widget
  ///based on the state (only Loading/not Loading) that's happening
  late Widget finalPageForLoadingMixin;

  @override
  void initState() {
    super.initState();
    finalPageForLoadingMixin = TripleBuilder(
      store: tripleStore,
      builder: (context, triple) => triple.isLoading ? onLoadingWidget : onStateWidgetWhenNotLoading,
    );
  }
}
