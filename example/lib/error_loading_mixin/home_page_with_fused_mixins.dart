import 'package:flutter/material.dart';
import 'package:triple_mixins/triple_mixins.dart';

import '../triple_stores/home_page_store.dart';
import '../widgets/on_state_widget.dart';

class HomePageWithFusedMixins extends StatefulWidget {
  const HomePageWithFusedMixins({Key? key}) : super(key: key);

  @override
  _HomePageWithFusedMixinsState createState() =>
      _HomePageWithFusedMixinsState();
}

class _HomePageWithFusedMixinsState extends State<HomePageWithFusedMixins>
    with LoadingErrorMixin {
  @override
  HomePageStore get tripleStore => HomePageStore();

  @override
  Widget build(BuildContext context) => finalPage;

  @override
  Widget get onErrorWidget =>
      const Center(child: const Text('An error just ocurred'));

  @override
  Widget get onLoadingWidget =>
      const Center(child: const CircularProgressIndicator());

  @override
  Widget get onStateWidget => OnStateWidget(tripleStore: tripleStore);
}
