import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _streamController = StreamController<int>();
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          _streamController.sink.add(++_counter);
        },
      ),
      body: Center(
        child: StreamBuilder<int>(
          initialData: _counter,
          stream: _streamController.stream,
          builder: (context, snapshot) {
            return Text(
              "Hello: ${snapshot.data.toString()}",
              style: Theme.of(context).textTheme.headline,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
