import 'package:flutter/material.dart';

import '../controllers/counter_page_controller.dart';

class CounterPageView extends StatefulWidget {
  const CounterPageView({super.key, required this.title});

  final String title;

  @override
  State<CounterPageView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPageView> {
  final controller = CounterPageController();

  @override
  void initState() {
    super.initState();

    controller.counter.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${controller.counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
