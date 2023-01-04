import 'dart:async';

import 'package:flutter/foundation.dart';

enum Event { increment, decrement }

class CounterController {
  int counter = 0;

  final StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  final StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get eventSink => _eventController.sink;
  Stream<Event> get eventStream => _eventController.stream;

  StreamSubscription? listener;

  CounterController() {
    listener = eventStream.listen((Event event) {
      debugPrint('CounterController - <receive> <event notification>');
      switch (event) {
        case Event.increment:
          counter += 1;

          break;
        case Event.decrement:
          counter -= 1;
          break;
        default:
      }

      counterSink.add(counter);
      debugPrint('CounterController - <send> <event trigger>');
    });
  }

  dispose() {
    listener?.cancel();
    _counterController.close();
    _eventController.close();
  }
}
