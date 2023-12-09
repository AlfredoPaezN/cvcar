import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FlipView extends StatefulWidget {
  final Widget front, back;

  const FlipView({
    Key? key,
    required this.front,
    required this.back,
  }) : super(key: key);

  @override
  FlipViewState createState() => FlipViewState();
}

class FlipViewState extends State<FlipView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;
  Timer? _timer;

  AnimationController get controller {
    _controller ??= AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );

    return _controller!;
  }

  Animation get animation {
    _animation ??= Tween(begin: 0.0, end: 1.0).animate(controller);

    return _animation!;
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 375), _tick);
    super.initState();
  }

  void _tick(Timer timer) {
    if (!mounted) return;
    controller.repeat();
    // if (animation.isDismissed) {
    //   controller.forward();
    // } else if (animation.isCompleted) {
    //   controller.reverse();
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        bool isFront = controller.value < .5;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * animation.value + (isFront ? 0 : pi)),
          alignment: FractionalOffset.center,
          child: isFront ? widget.front : widget.back,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }
}
