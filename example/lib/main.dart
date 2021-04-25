import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_mixins/triple_mixins.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePageStore extends NotifierStore<Object, String> {
  HomePageStore() : super('');
}

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingMixin, ErrorMixinWithWidget {
  @override
  Widget build(BuildContext context) => finalPageForErrorMixin;

  @override
  Widget get onErrorWidget => const Center(
        child: const Text('An error just ocurred'),
      );

  @override
  Widget get onLoadingWidget => const Center(
        child: const CircularProgressIndicator(),
      );

  @override
  Widget get onStateWidgetWhenNotError => finalPageForLoadingMixin;

  @override
  Widget get onStateWidgetWhenNotLoading => Scaffold(
        appBar: AppBar(
          title: const Text('Home Page - with Loading and Error mixins'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ),
                    );
                  },
                  child: const Text("Go to the Second Page")),
            ],
          ),
        ),
      );

  @override
  Store<Object, Object> get tripleStore => HomePageStore();
}

class SecondPageStore extends NotifierStore<Object, String> {
  SecondPageStore() : super('');
}

class SecondPage extends StatefulWidget {
  const SecondPage();

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with LoadingErrorMixin {
  @override
  Widget build(BuildContext context) => finalPage;

  @override
  Widget get onErrorWidget => const Center(
        child: const Text('An error just ocurred'),
      );
  @override
  Widget get onLoadingWidget => const Center(
        child: const CircularProgressIndicator(),
      );

  @override
  Widget get onStateWidget => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page - with LoadingErrorMixin'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final dateTimeNow = DateTime.now();
                final hour = dateTimeNow.hour;
                final sentence = '🕒 {$dateTimeNow}'
                    '${(hour == 3 || hour == 15 ? '\nTime to use Triple!' : '')}';
                print(sentence);
              },
              child: const Text("Thanks for being here. :)"),
            )
          ],
        )),
      );

  @override
  Store<Object, Object> get tripleStore => SecondPageStore();
}
