import 'package:flutter/material.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/column_data.dart';
import 'package:flutter_excel/models/table/row_data.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_references.dart';

class TableData with ChangeNotifier {
  late String _name;

  final ColumnStyle defaultColumnStyle;
  final RowStyle defaultRowStyle;

  late List<ColumnData> _columns = [_createColumnData(1)];
  late List<RowData> _rows = [_createRowData(1)];

  late List<List<CellData>> _cells = [[ _createDefaultCell(CellName.fromString('A1')) ]];

  late TableReferences _references;

  TableData({
    required String name,
    required this.defaultColumnStyle,
    required this.defaultRowStyle,
    int initialRowsCount = 0,
    int initialColumnsCount = 0,
  }) {
    _name = name;
    _references = TableReferences(this);

    for(int i = 1; i < initialRowsCount; ++i) {
      addRow();
    }

    for(int i = 1; i < initialColumnsCount; ++i) {
      addColumn();
    }
  }

  factory TableData.fromJson({
    required Map<String, dynamic> json,
    required ColumnStyle defaultColumnStyle,
    required RowStyle defaultRowStyle,
  }) {
    final table = TableData(
      name: json['name'],
      defaultColumnStyle: defaultColumnStyle,
      defaultRowStyle: defaultRowStyle,
    );

    table._references = TableReferences.fromJson(
      table: table,
      json: json['references']
    );

    final columnsJson = json['columns'] as List<dynamic>;
    table._columns = Iterable.generate(columnsJson.length)
      .map((i) => ColumnData.fromJson(
        table: table,
        index: i+1,
        json: columnsJson[i]
      ))
      .toList();

    final rowsJson = json['rows'] as List<dynamic>;
    table._rows = Iterable.generate(rowsJson.length)
      .map((i) => RowData.fromJson(
        table: table,
        index: i+1,
        json: rowsJson[i]
      ))
      .toList();

    final cellsJson = json['cells'] as List<dynamic>;

    table._cells = Iterable.generate(cellsJson.length)
      .map((row) => Iterable.generate(cellsJson.first.length)
          .map((column) => CellData.fromJson(
            table: table,
            name: CellName.fromIndex(column: column+1, row: row+1),
            json: cellsJson[row][column]
          )
        ).toList()
      ).toList();

    for(final row in table._cells) {
      for(final cell in row) {
        cell.update();
      }
    }

    return table;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'references': _references.toJson(),
      'columns': _columns,
      'rows': _rows,
      'cells': _cells
    };
  }

  int get rowsCount => _cells.length;
  int get columnsCount => _cells.first.length;

  TableReferences get references => _references;

  String get name => _name;
  set name(String name) {
    _name = name;
    notifyListeners();
  }

  void addRow([RowStyle? style]) {
    final rowIndex = _rows.length;

    _rows.add(_createRowData(rowIndex+1, style));

    final row = List.generate(
      _cells[0].length,
      (index) => _createDefaultCell(CellName.fromIndex(column: index+1, row: rowIndex+1))
    );

    _cells.add(row);

    notifyListeners();
  }

  void removeRow(int index) {
    if(_rows.length <= 1 || index < 1 || index > _rows.length) {
      return;
    }

    index--;

    _rows.removeAt(index);
    final removedCells = _cells.removeAt(index);

    for(final cell in removedCells) {
      _references.notifyListeners(cell.name);
    }

    _updateIndex();

    notifyListeners();
  }

  void addColumn([ColumnStyle? style]) {
    int columnIndex = _columns.length;

    _columns.add(_createColumnData(columnIndex+1, style));

    for(int i = 0; i < _cells.length; ++i) {
      final cell = _createDefaultCell(CellName.fromIndex(column: columnIndex+1, row: i+1));

      _cells[i].add(cell);
    }
    notifyListeners();
  }

  void removeColumn(int index) {
    if(_columns.length <= 1 || index < 1 || index > _columns.length) {
      return;
    }

    index--;

    _columns.removeAt(index);

    final removedCells = <CellData>[];
    for(final row in _cells) {
      removedCells.add(row.removeAt(index));
    }

    for(final cell in removedCells) {
      _references.notifyListeners(cell.name);
    }

    _updateIndex();

    notifyListeners();
  }

  void _updateIndex() {
    for(int i = 1; i <= _rows.length; ++i) {
      _rows[i-1].index = i;
    }

    for(int i = 1; i <= _columns.length; ++i) {
      _columns[i-1].index = i;
    }

    for(int row = 1; row <= _rows.length; ++row) {
      for(int column = 1; column <= _columns.length; ++column) {
        _cells[row-1][column-1].name = CellName.fromIndex(column: column, row: row);
      }
    }
  }

  CellData getCell(CellName name) {
    return _cells[name.row-1][name.column-1];
  }

  CellData? getCellOrNull(CellName name) {
    int row = name.row-1;
    int column = name.column-1;

    if(row < 0 || row >= _cells.length || column < 0 || column >= _cells.first.length) {
      return null;
    }

    return _cells[row][column];
  }

  ColumnData getColumn(int index) {
    return _columns[index-1];
  }

  List<ColumnData> getColumns() {
    return _columns;
  }

  RowData getRow(int index) {
    return _rows[index-1];
  }

  List<RowData> getRows() {
    return _rows;
  }

  RowData _createRowData(int index, [RowStyle? style]) => RowData(
    index: index,
    table: this,
    style: style ?? defaultRowStyle
  );

  ColumnData _createColumnData(int index, [ColumnStyle? style]) => ColumnData(
    index: index,
    table: this,
    style: style ?? defaultColumnStyle
  );

  CellData _createDefaultCell(CellName name) => CellData(table: this, name: name);
}
