import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedor Animado")
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.play_arrow),
      )
      
    );
  }

  _cambiarForma() {

    final rand = Random();

    setState(() {
      _width = rand.nextInt(300).toDouble();
      _height = rand.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        rand.nextInt(255),
        rand.nextInt(255),
        rand.nextInt(255),
        1
      );
      _borderRadius = BorderRadius.circular(rand.nextInt(200).toDouble());
    });
  }
}