import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

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
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: FlutterLogo(
                size: 300 * _opacity,
              ),
            ),
            Slider.adaptive(
                min: 0.0,
                max: 1.0,
                value: _opacity,
                onChanged: (double value) {
                  setState(() {
                    _opacity = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
