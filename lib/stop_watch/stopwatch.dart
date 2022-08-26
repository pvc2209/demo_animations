import 'dart:async';

import 'package:demo_animations/stop_watch/elapsed_time_text.dart';
import 'package:demo_animations/stop_watch/stopwatch_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with TickerProviderStateMixin {
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2.0;
        return StopWatchRenderer(
          elapsed: _elapsed,
          radius: radius,
        );
      },
    );
  }
}
