import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_excel/services/cell_parser/cell_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cell parser tests', () {

    test('Valid tests with primitives', () {
      final table = _createEmptyTable();

      expect(CellParser.evaluate('3', table).value, equals(3));
      expect(CellParser.evaluate('11.3230', table).value, equals(11.3230));
      expect(CellParser.evaluate('3 + 4*5', table).value, equals(23));
      expect(CellParser.evaluate('true', table).value, equals(true));
      expect(CellParser.evaluate('2 > 3', table).value, equals(false));
      expect(CellParser.evaluate('4 > 8 or not (33 <> 3)', table).value, equals(false));
    });

    test('Valid tests with cells', () {
      final table = _createEmptyTable();

      final cell1 = table.getCell(CellName.fromString('A1'));

      final cell2 = table.getCell(CellName.fromString('A2'));

      final cell3 = table.getCell(CellName.fromString('A3'));

      cell1
        ..text = ('3')
        ..update();
      expect(cell1.value, equals(3));

      cell2
        ..text = ('A1 - 2')
        ..update();
      expect(cell2.value, equals(1));

      cell3
        ..text = ('A2 * 2')
        ..update();
      expect(cell3.value, equals(2));

      cell1
        ..text = ('12')
        ..update();
      expect(cell3.value, equals(20));

      cell1
        ..text = ('true')
        ..update();
      cell2
        ..text = ('33 > 10 * 3')
        ..update();

      expect(cell3.value, equals('Invalid input'));

      cell3
        ..text = ('A1 and A2')
        ..update();

      expect(cell3.value, equals(true));

      cell1
        ..text = ('false')
        ..update();
      expect(cell3.value, equals(false));
    });

    test('Self reference error', () {
      final table = _createEmptyTable();

      final cell = table.getCell(CellName.fromString('A1'));

      cell
        ..text = ('A1 == A1')
        ..update();

      expect(cell.value.toString().contains('self reference'), true);
    });

    test('Circular reference error', () {
      final table = _createEmptyTable();

      final cell1 = table.getCell(CellName.fromString('A1'));
      final cell2 = table.getCell(CellName.fromString('A2'));
      final cell3 = table.getCell(CellName.fromString('A3'));

      cell1
        ..text = ('1')
        ..update();

      cell2
        ..text = ('A1 + 1')
        ..update();

      cell3
        ..text = ('A2 + 1')
        ..update();

      expect(cell3.value, equals(3));

      cell1
        ..text = ('A3 + 1')
        ..update();

      expect(cell1.value.toString().contains('circular reference'), equals(true));
    });
  });
}

TableData _createEmptyTable() => TableData(
  name: 'test_table',
  defaultColumnStyle: const ColumnStyle(width: 80),
  defaultRowStyle: const RowStyle(height: 36),
  initialColumnsCount: 5,
  initialRowsCount: 5
);
