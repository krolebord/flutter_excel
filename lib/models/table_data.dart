import 'package:flutter/material.dart';
import 'package:flutter_excel/models/cell.dart';
import 'package:flutter_excel/models/cell_data.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';

class TableData with ChangeNotifier {
  final ColumnStyle defaultColumnStyle;
  final RowStyle defaultRowStyle;

  late final List<ColumnStyle> _columns = [defaultColumnStyle];
  late final List<RowStyle> _rows = [defaultRowStyle];

  late final List<List<Cell>> _cells = [[ _createDefaultCell(CellName.fromString('A1')) ]];

  TableData({
    required this.defaultColumnStyle,
    required this.defaultRowStyle,
    int initialRowsCount = 0,
    int initialColumnsCount = 0,
  }) {
    for(int i = 0; i < initialRowsCount-1; ++i) {
      addRow();
    }

    for(int i = 0; i < initialRowsCount-1; ++i) {
      addColumn();
    }
  }

  void addRow([RowStyle? style]) {
    style ??= defaultRowStyle;

    final rowIndex = _rows.length;

    _rows.add(style);

    final row = List.generate(
      _cells[0].length,
      (index) => _createDefaultCell(CellName.fromIndex(column: index+1, row: rowIndex))
    );

    _cells.add(row);

    notifyListeners();
  }

  void addColumn([ColumnStyle? style]) {
    style ??= defaultColumnStyle;

    int columnIndex = _columns.length;

    _columns.add(style);

    for(int i = 0; i < _cells.length; ++i) {
      final cell = _createDefaultCell(CellName.fromIndex(column: columnIndex, row: i+1));

      _cells[i].add(cell);
    }

    notifyListeners();
  }

  Cell getCell(CellName name) {
    return _cells[name.row][name.column];
  }

  Cell _createDefaultCell(CellName name) => Cell(
    data: CellData(name: name),
    columnStyle: defaultColumnStyle,
    rowStyle: defaultRowStyle
  );
}
