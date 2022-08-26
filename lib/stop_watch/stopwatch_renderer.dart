import 'dart:math';

import 'package:demo_animations/stop_watch/clock_hand.dart';
import 'package:demo_animations/stop_watch/clock_markers.dart';
import 'package:flutter/material.dart';

import 'package:demo_animations/stop_watch/elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 60; ++i)
          Positioned(
            left: radius,
            top: radius,
            child: ClockMarker(
              radius: radius,
              seconds: i,
            ),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(
              radius: radius,
              value: i,
              maxValue: 60,
            ),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + 2 * pi * (elapsed.inMilliseconds / 60000),
            handThickness: 2,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
