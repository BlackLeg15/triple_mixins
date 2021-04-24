import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class OnStateWidget extends StatefulWidget {
  final Store tripleStore;

  const OnStateWidget({Key? key, required this.tripleStore}) : super(key: key);

  @override
  _OnStateWidgetState createState() => _OnStateWidgetState();
}

class _OnStateWidgetState extends State<OnStateWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
