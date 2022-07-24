import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ValueNotifier<int>>(
          create: (context) => ValueNotifier<int>(0), child: const MyHomePage()),
    );
  }
}

class  MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ValueNotifier<int>>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter value: ${counter.value}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ValueNotifier<int>>(
              builder: (_, value, __) => Text("Counter value: ${counter.value}",
              ),
              ),
            TextButton(
                onPressed: () {
                  counter.value++;
                },
                child: const Text("Increase")),
          ],
        ),
      ),
    );
  }
}
