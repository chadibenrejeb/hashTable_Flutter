import 'package:flutter/material.dart';
import 'hash_table_service.dart';

class TableCanvas extends StatefulWidget {
  final HashTableService hashTableService;

  TableCanvas({required this.hashTableService});

  @override
  _TableCanvasState createState() => _TableCanvasState();
}

class _TableCanvasState extends State<TableCanvas> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 200),
      painter: TablePainter(widget.hashTableService.getTable()),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.hashTableService.addListener(_onHashTableChanged);
  }

  @override
  void dispose() {
    widget.hashTableService.removeListener(_onHashTableChanged);
    super.dispose();
  }

  void _onHashTableChanged() {
    setState(() {});
  }
}

class TablePainter extends CustomPainter {
  final List<List<String>> table;

  TablePainter(this.table);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

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
