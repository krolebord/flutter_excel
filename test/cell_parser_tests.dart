import 'package:flutter_excel/models/cell.dart';
import 'package:flutter_excel/models/cell_data.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table_data.dart';
import 'package:flutter_excel/services/cell_parser/cell_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cell parser tests', () {

    test('Valid tests with primitives', () {
      final table = createEmptyTable();
      final parser = CellParser();

      expect(parser.evaluate('3', table).value, equals(3));
      expect(parser.evaluate('3 + 4*5', table).value, equals(23));
      expect(parser.evaluate('true', table).value, equals(true));
      expect(parser.evaluate('2 > 3', table).value, equals(false));
      expect(parser.evaluate('4 > 8 or not (33 <> 3)', table).value, equals(false));
    });

    test('Valid tests with cells', () {
      final table = createEmptyTable();

      final cell1 = table.getCell(CellName.fromString('A1'))
        ..data = CellData(name: CellName.fromString('A1'), text: '3');

      final cell2 = table.getCell(CellName.fromString('A2'))
        ..data = CellData(name: CellName.fromString('A2'), text: 'A1 - 2');

      final cell3 = table.getCell(CellName.fromString('A3'))
        ..data = CellData(name: CellName.fromString('A3'), text: 'A2 * 2');


      final parser = CellParser();

      cell1.data.update(table);
      expect(parser.evaluate('A1', table).value, equals(3));
      expect(parser.evaluate('A2', table).value, equals(1));
      expect(parser.evaluate('A3', table).value, equals(2));
    });

  });
}

TableData createEmptyTable() => TableData(
  defaultColumnStyle: const ColumnStyle(width: 80),
  defaultRowStyle: const RowStyle(height: 36),
  initialColumnsCount: 5,
  initialRowsCount: 5
);
