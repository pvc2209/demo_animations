import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform(
              transform: Matrix4.identity()
                // ..translate(60 / 2, 0.0, 0.0)
                ..rotateZ(_angle * pi / 180),
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 200,
                color: Colors.blue,
                child: const Text("rotationZ"),
              ),
            ),
            Slider.adaptive(
              min: 0.0,
              max: 360.0,
              value: _angle,
              onChanged: (value) {
                setState(() {
                  _angle = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
