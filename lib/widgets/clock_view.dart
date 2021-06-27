import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 300,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ));
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);
    DateTime datetime = DateTime.now();
    double secHandX = centerX + 80 * cos(datetime.second * 6 * pi / 180);
    double secHandY = centerY + 80 * sin(datetime.second * 6 * pi / 180);
    double hourX = centerX +
        80 * cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        80 * sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    double minX = centerX + 80 * cos(datetime.minute * 6 * pi / 180);
    double minY = centerY + 80 * sin(datetime.minute * 6 * pi / 180);
    //fill brush
    Paint fillBrush = Paint()..color = Color(0xFF444974);

    // outline brush
    Paint outlineBrush = Paint()
      ..strokeWidth = 16
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke;

    // center brush
    Paint centerBrush = Paint()..color = Color(0xFFEAECFF);

    // dashed bresh
    Paint dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

// drawing
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    //hour hand
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        handBrush(
            center: center,
            radius: radius,
            c1: Color(0xFF748EF6),
            c2: Color(0xFF77DDFF),
            strokWidth: 4));
    //min hand
    canvas.drawLine(
        center,
        Offset(minX, minY),
        handBrush(
            center: center,
            radius: radius,
            c1: Color(0xFFEA74AB),
            c2: Color(0xFF3279fb),
            strokWidth: 4));
    //second hand
    canvas.drawLine(
        center,
        Offset(secHandX, secHandY),
        handBrush(
            center: center,
            radius: radius,
            c1: Colors.orange.shade300,
            c2: Colors.orange.shade300,
            strokWidth: 8));


    canvas.drawCircle(center, 16, centerBrush);
     var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Paint handBrush(
    {Color? c2,
    required Color c1,
    required double strokWidth,
    required Offset center,
    required double radius}) {
  return Paint()
    ..shader = RadialGradient(colors: [c1, c2!])
        .createShader(Rect.fromCircle(center: center, radius: radius))
    ..strokeWidth = strokWidth
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;
}
