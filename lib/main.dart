import 'package:flutter/material.dart';
import 'package:solid_flutter_learn/pizza.dart';

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
    return MaterialApp(
      title: 'Factory Method Pattern',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  PizzaDirector director = PizzaDirector();

  PizzaBuilder hawaiianPizzaBuilder = HawaiianPizzaBuilder();
  PizzaBuilder newYorkPizzaBuilder = NewYorkPizzaBuilder();

  void buildPizza() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        director.setPizzaBuilder(hawaiianPizzaBuilder);
        director.makePizza();
        Pizza myPizza = director.getPizza();
        debugPrint(myPizza.toString());
      } else {
        director.setPizzaBuilder(newYorkPizzaBuilder);
        director.makePizza();
        Pizza myPizza = director.getPizza();
        debugPrint(myPizza.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern'),
      ),
      body: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: buildPizza,
        child: const Text('Generate New Random Shape'),
      ),
    );
  }
}
