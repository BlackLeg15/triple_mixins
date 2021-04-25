import 'package:flutter/material.dart';
import 'package:triple_mixins/triple_mixins.dart';

import '../triple_stores/home_page_store.dart';
import '../widgets/on_state_widget.dart';

class HomePageWithSeparatedMixins extends StatefulWidget {
  const HomePageWithSeparatedMixins({Key? key}) : super(key: key);

  @override
  _HomePageWithSeparatedMixinsState createState() =>
      _HomePageWithSeparatedMixinsState();
}

class _HomePageWithSeparatedMixinsState
    extends State<HomePageWithSeparatedMixins>
    with LoadingMixin, ErrorMixinWithWidget {
  @override
  HomePageStore get tripleStore => HomePageStore();

  @override
  Widget build(BuildContext context) => finalPageForErrorMixin;

  @override
  Widget get onErrorWidget =>
      const Center(child: const Text('An error just ocurred'));

  @override
  Widget get onStateWidgetWhenNotError => finalPageForLoadingMixin;

  @override
  Widget get onLoadingWidget =>
      const Center(child: const CircularProgressIndicator());

  @override
  Widget get onStateWidgetWhenNotLoading =>
      OnStateWidget(tripleStore: tripleStore);
}
