import 'dart:convert';
import 'dart:math';

import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_excel/models/table/table_references.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers/throws_parser_error.dart';

void main() {
  test('Table serialization', () {
    const rowStyle = RowStyle(height: 36);
    const columnStyle = ColumnStyle(width: 72);

    final table = TableData(
        name: 'table1',
        defaultRowStyle: rowStyle,
        defaultColumnStyle: columnStyle
    );

    for(int i = 0; i < 4; ++i) {
      table.addColumn();
    }

    for(int i = 0; i < 2; ++i) {
      table.addRow();
    }

    table.getCell(CellName.fromString('A1'))
      ..text = 'Ar'
      ..isTextExpression = true
      ..update();

    table.getCell(CellName.fromString('B2'))
      ..text = '3.3'
      ..update();

    table.getCell(CellName.fromString('B3'))
      ..text = 'true'
      ..update();

    table.getCell(CellName.fromString('C3'))
      ..text = 'B2 = B3'
      ..update();

    final serialized1 = json.encode(table.toJson());

    final deserialized = TableData.fromJson(
        json: jsonDecode(serialized1),
        defaultColumnStyle: columnStyle,
        defaultRowStyle: rowStyle
    );

    final serialized2 = json.encode(deserialized);

    expect(serialized1, equals(serialized2));
  });
}
