import 'package:flutter/material.dart';

import 'error_loading_mixin/home_page_with_fused_mixins.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePageWithFusedMixins(),
      //home: const HomePageWithSeparatedMixins(),
    );
  }
}
