import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask(
      {super.key, required this.actualPlaces, required this.expectedPlaces});

  final int actualPlaces;
  final int expectedPlaces;

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  double progress = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.actualPlaces > 0 && widget.expectedPlaces > 0) {
      progress = widget.actualPlaces / widget.expectedPlaces;
    }
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            TaskCompletionWidget(progress: progress),
            if (widget.actualPlaces == widget.expectedPlaces)
              const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: Colors.green,
                size: 30,
              ),
            if (widget.actualPlaces != widget.expectedPlaces)
              Center(
                child: Text(
                  '${progress.toInt()}%',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
          ],
        );
      },
    );
  }
}

class TaskCompletionWidget extends StatelessWidget {
  const TaskCompletionWidget({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          taskCompletedColor: Theme.of(context).primaryColor,
          taskNotCompletedColor: Colors.white,
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress,
    required this.taskNotCompletedColor,
    required this.taskCompletedColor,
  });

  final double progress;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
