import 'package:flutter/material.dart';
import 'hash_table_service.dart';
import 'table_painter.dart';  // Ensure this import is present

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
