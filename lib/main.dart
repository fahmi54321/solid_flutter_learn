import 'package:flutter/material.dart';
import 'package:solid_flutter_learn/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Factory Method Pattern',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterController _counterController;

  @override
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  stream: _counterController.counterStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      debugPrint(
                          '_MyHomePageState - <receive> <event notification> data: ${snapshot.data}');
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_MyHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.decrement);
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_MyHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.increment);
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
