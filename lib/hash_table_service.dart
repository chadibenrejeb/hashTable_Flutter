import 'dart:collection';
import 'package:flutter/material.dart';

class HashTableService extends ChangeNotifier {
  final int _tableSize = 10;
  final List<List<String>> _table;

  HashTableService() : _table = List.generate(10, (_) => []);

  int _hashFunction(String key) {
    int hashValue = 0;
    for (int i = 0; i < key.length; i++) {
      hashValue = (hashValue + key.codeUnitAt(i)) * 31;
    }
    return hashValue.abs() % _tableSize;
  }

  void add(String key) {
    int index = _hashFunction(key);
    if (!_table[index].contains(key)) {
      _table[index].add(key);
      notifyListeners();
    }
  }

  void remove(String key) {
    int index = _hashFunction(key);
    _table[index].remove(key);
    notifyListeners();
  }

  bool contains(String key) {
    int index = _hashFunction(key);
    return _table[index].contains(key);
  }

  String display() {
    return _table.asMap().entries.map((entry) {
      int index = entry.key;
      List<String> bucket = entry.value;
      return '$index: ${bucket.join(', ')}';
    }).join('\n');
  }

  int getTableSize() {
    return _table.fold(0, (sum, bucket) => sum + bucket.length);
  }

  List<List<String>> getTable() {
    return _table;
  }
}
