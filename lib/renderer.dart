import 'package:flutter/material.dart';

abstract class Renderer {
  Widget render();
}

class ImageRenderer extends Renderer {
  @override
  Widget render() {
    return Image.asset('images/dart_with_flutter.png');
  }
}

class ButtonRenderer extends Renderer {
  @override
  Widget render() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: () {
        debugPrint('Elevated Button Pressed');
      },
      child: const Text('Elevated Button'),
    );
  }
}

class WidgetRenderer extends Renderer {
  @override
  Widget render() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('Tapped The Row');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.local_fire_department,
            color: Colors.amberAccent,
          ),
          Text('Row Widget'),
          Icon(Icons.local_fire_department),
        ],
      ),
    );
  }
}
