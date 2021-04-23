import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:asuka/asuka.dart' as asuka;

//all credits to David Araujo
mixin ErrorMixinWithSnackbar<T extends StatefulWidget> on State<T> {
  Store<Object, Object> get store;
  late Future<void> Function() _observerDisposer;

  @override
  void dispose() async {
    await _observerDisposer.call();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _observerDisposer = store.observer(
      onError: (failure) {
        debugPrint("🔴 OCORREU UM ERRO - ${failure.toString()}");
        asuka.showSnackBar(SnackBar(content: Text(failure.toString())));
      },
    );
  }
}
