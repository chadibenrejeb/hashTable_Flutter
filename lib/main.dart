import 'package:flutter/material.dart';
import 'hash_table_service.dart';
import 'control_panel.dart';
import 'table_canvas.dart';  // Ensure this import is present

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HashTableService hashTableService = HashTableService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hash Table Visualization'),
        ),
        body: Column(
          children: [
            Expanded(child: TableCanvas(hashTableService: hashTableService)),
            ControlPanel(hashTableService: hashTableService),
          ],
        ),
      ),
    );
  }
}
