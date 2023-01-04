import 'package:flutter/material.dart';
import 'package:solid_flutter_learn/list_with_separator.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adapter Patterns'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('XML Contacts'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('JSON Contacts'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => XMLLongListWithSeparator(),
                  ),
                );
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JSONLongListWithSeparator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
