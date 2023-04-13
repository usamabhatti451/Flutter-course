import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  List<int> _counters = [0, 0, 0];

  void _incrementCounter() {
    setState(() {
      _counters[_currentIndex]++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter incremented '), duration: const Duration(milliseconds: 150),),
      );
    });
  }

  void _reset() {
    setState(() {
      _counters[_currentIndex] = 0;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter reset'),duration: const Duration(milliseconds: 150),),
      );
    });
  }

  void _decrement() {
    setState(() {
      _counters[_currentIndex]--;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter decremented'),duration: const Duration(milliseconds: 150)),
      );
    });
  }

  void _switchCounter(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Select a counter:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < _counters.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => _switchCounter(i),
                        child: Text('Counter ${i + 1}'),
                        style: ButtonStyle(
                          backgroundColor: _currentIndex == i
                              ? MaterialStateProperty.all<Color>(
                              Colors.lightGreen)
                              : null,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Counter value:'),
              Text(
                '${_counters[_currentIndex]}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
        ElevatedButton(
          onPressed: _decrement,
          child: const Icon(Icons.remove),
        ),
        ElevatedButton(
          onPressed: _reset,
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
