import 'package:flutter/material.dart';

class CounterPageView extends StatefulWidget {
  const CounterPageView({super.key});

  @override
  State<CounterPageView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPageView> {
  final counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Couter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (_, value, __) => Text(
                '$value',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
