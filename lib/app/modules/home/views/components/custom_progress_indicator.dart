import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  const CustomCircularProgressIndicator({
    Key? key,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _startAngleAnimation;
  late Animation<double> _endAngleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _startAngleAnimation = Tween<double>(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _endAngleAnimation = Tween<double>(begin: 0.0, end: 360.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.5, 1.0, curve: Curves.linear)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _CircularProgressPainter(
            backgroundColor: widget.backgroundColor,
            progressColor: widget.progressColor,
            strokeWidth: widget.strokeWidth,
            startAngle: _startAngleAnimation.value,
            endAngle: _endAngleAnimation.value,
          ),
          child: const SizedBox(
            width: 50,
            height: 50,
          ),
        );
      },
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;

  _CircularProgressPainter({
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
    required this.startAngle,
    required this.endAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the moving arc
    const double sweepAngle = 60.0; // Fixed length of the arc (in degrees)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      (startAngle - 90) * (3.1415926535897932 / 180.0),
      sweepAngle * (3.1415926535897932 / 180.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
