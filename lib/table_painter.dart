  import 'package:flutter/material.dart';
import 'dart:math';

class TablePainter extends CustomPainter {
  final List<List<String>> table;

  TablePainter(this.table);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    final arrowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1  // Decrease the arrow width here
      ..style = PaintingStyle.stroke;

    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
    );

    double yOffset = 10;
    for (int i = 0; i < table.length; i++) {
      double xOffset = 10;

      // Draw index rectangle
      canvas.drawRect(
        Rect.fromLTWH(xOffset, yOffset, 100, 20),
        paint,
      );
      _drawText(canvas, i.toString(), xOffset + 5, yOffset + 2, textStyle);

      xOffset += 110;
      for (var key in table[i]) {
        // Draw key rectangle
        canvas.drawRect(
          Rect.fromLTWH(xOffset, yOffset, 100, 20),
          paint,
        );
        _drawText(canvas, key, xOffset + 5, yOffset + 2, textStyle);

        // Draw arrow
        final arrowPath = Path();
        arrowPath.moveTo(xOffset - 10, yOffset + 10);
        arrowPath.lineTo(xOffset, yOffset + 10);
        arrowPath.lineTo(xOffset - 5, yOffset + 5);
        arrowPath.moveTo(xOffset, yOffset + 10);
        arrowPath.lineTo(xOffset - 5, yOffset + 15);
        canvas.drawPath(arrowPath, arrowPaint);

        xOffset += 110;
      }
      yOffset += 30;
    }
  }

  void _drawText(Canvas canvas, String text, double x, double y, TextStyle style) {
    final textSpan = TextSpan(
      text: text,
      style: style,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x, y));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
