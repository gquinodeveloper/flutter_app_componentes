import 'dart:math';

import 'package:flutter/material.dart';

class AnimacionContainer extends StatefulWidget {
  const AnimacionContainer({Key key}) : super(key: key);

  @override
  _AnimacionContainerState createState() => _AnimacionContainerState();
}

class _AnimacionContainerState extends State<AnimacionContainer> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cambiarForma(),
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    // 0 - 300
    print(random.nextInt(300));

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1.0,
      );

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
