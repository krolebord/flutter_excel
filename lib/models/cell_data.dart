import 'package:flutter/cupertino.dart';
import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table_data.dart';
import 'package:flutter_excel/services/cell_parser/cell_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CellData {
  final CellName name;

  String text;

  dynamic value;

  final Set<CellName> _listeners = {};

  final Set<CellName> _referencedCells = {};

  CellData({
    required this.name,
    this.text = ''
  }) {
    value = text;
  }

  void addListener(CellName listener) {
    _listeners.add(value);
  }

  void removeListener(CellName listener) {
    _listeners.remove(listener);
  }

  void update(TableData table) {
    for(final reference in _referencedCells) {
      final cell = table.getCell(reference);
      cell.data.removeListener(name);
    }

    // TODO If not text expression

    var parser = CellParser();

    try {
      final result = parser.evaluate(text, table);

      value = result.value;

      _referencedCells.clear();
      _referencedCells.addAll(result.referencedCells);

      for(final reference in _referencedCells) {
        final cell = table.getCell(reference);
        cell.data.addListener(name);
      }

      for(final listener in _listeners) {
        final cell = table.getCell(listener);
        cell.data.update(table);
      }
    }
    on CellParserError catch(error) {
      value = error.message;
      _referencedCells.clear();
    }
    catch(_) {
      value = 'Invalid input';
      _referencedCells.clear();
    }
  }
}
