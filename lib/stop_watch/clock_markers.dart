import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarker extends StatelessWidget {
  const ClockMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color =
        (seconds % 5 == 0) ? Colors.white : Colors.grey.withOpacity(0.7);
    const width = 2.0;
    const height = 12.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        // Giảm vòng for xuống để hiểu tại sao lại translate
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 30.0;
    const height = 26.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - height - 4, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: Container(
        width: width,
        height: height,
        // color: Colors.redAccent,
        alignment: Alignment.center,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
