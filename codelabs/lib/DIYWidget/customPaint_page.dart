import 'package:flutter/material.dart';
import 'dart:math';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaint'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300.0, 300.0), // 指定画布大小
          painter: _MyPainter(),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    // 画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill // 填充
      ..color = Color(0x77cdb175); // 背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    // 画棋盘网格
    paint
      ..style = PaintingStyle.stroke // 线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    // 横
    for (var i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    // 竖
    for (var i = 0; i <= 15; i++) {
      double dx = eHeight * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    // 画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2),
        paint);
  }

  // 在实际场景中正确利用此回调可以避免重绘开销，这里直接返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
