import 'package:flutter/material.dart';
import "package:flutter_fillbars/flutter_fillbars.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Fillbar example'.toUpperCase()),
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

  double value = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Fillbar(
              value: 130,
              height: 30,
              width: 180,
              fillColor: Colors.blue,
            ),
            Fillbar(
              value: value,
              height: 30,
              width: 180,
              fillColor: Colors.amber,
              direction: Direction.toLeft,
            ),
            const Fillbar(
              value: 130,
              height: 30,
              width: 180,
              fillColor: Colors.green,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Fillbar(
                  value: 85,
                  width: 30,
                  height: 180,
                  fillColor: Colors.deepPurple,
                  direction: Direction.toBottom,
                ),
                Fillbar(
                  value: 140,
                  height: 180,
                  width: 30,
                  fillColor: Colors.teal,
                  direction: Direction.toTop,
                ),
                Fillbar(
                  value: 85,
                  width: 30,
                  height: 180,
                  fillColor: Colors.cyan,
                  direction: Direction.toBottom,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value += 5;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}