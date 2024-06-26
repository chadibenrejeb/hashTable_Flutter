import 'package:flutter/material.dart';
import 'hash_table_service.dart'; // Import your HashTableService file here

class ControlPanel extends StatefulWidget {
  final HashTableService hashTableService;

  ControlPanel({Key? key, required this.hashTableService}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  final TextEditingController _keyController = TextEditingController();
  String _message = '';

  void _addKey() {
    setState(() {
      widget.hashTableService.add(_keyController.text);
      _message = 'Added key: ${_keyController.text}';
      _keyController.clear();
    });
  }

  void _removeKey() {
    setState(() {
      widget.hashTableService.remove(_keyController.text);
      _message = 'Removed key: ${_keyController.text}';
      _keyController.clear();
    });
  }

  void _checkKey() {
    setState(() {
      bool contains = widget.hashTableService.contains(_keyController.text);
      _message = contains
          ? 'Hash table contains key: ${_keyController.text}'
          : 'Hash table does not contain key: ${_keyController.text}';
      _keyController.clear();
    });
  }

  void _displayTable() {
    setState(() {
      _message = widget.hashTableService.display();
    });
  }

  void _getTableSize() {
    setState(() {
      _message = 'Hash table size: ${widget.hashTableService.getTableSize()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _keyController,
          decoration: const InputDecoration(
            labelText: 'Enter key',
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _addKey,
              child: const Text('Add'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: _removeKey,
              child: const Text('Remove'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: _checkKey,
              child: const Text('Contains'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: _displayTable,
              child: const Text('Display'),
            ),
            SizedBox(width: 8),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getTableSize,
              child: const Text('Table Size'),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(_message),
      ],
    );
  }
}
