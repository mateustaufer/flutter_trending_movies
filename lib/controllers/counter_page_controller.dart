import 'package:flutter/material.dart';

class CounterPageController {
  var counter = ValueNotifier(0);

  void incrementCounter() {
    counter.value++;
  }
}
