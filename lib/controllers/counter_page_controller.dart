import 'package:flutter/material.dart';

class CounterPageController {
  var counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }
}
