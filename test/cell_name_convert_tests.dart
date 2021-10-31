import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers/throws_parser_error.dart';

void main() {
  group('Cell name convert', () {

    test('Cell name from index is correct', () {
      var cellName = CellName.fromIndex(column: 1, row: 1);

      expect(cellName.column, equals(1));
      expect(cellName.row, equals(1));
      expect(cellName.text, equals('A1'));

      cellName = CellName.fromIndex(column: 1000, row: 1000);

      expect(cellName.column, equals(1000));
      expect(cellName.row, equals(1000));
      expect(cellName.text, equals('ALL1000'));
    });

    test('Cell name from index throws error', () {
      expect(() => CellName.fromIndex(column: 0, row: 3), throwsParserError());
      expect(() =>CellName.fromIndex(column: 4, row: -3), throwsParserError());
    });

    test('Cell name from string is correct', () {
      var cellName = CellName.fromIndex(column: 1, row: 1);

      expect(cellName.column, equals(1));
      expect(cellName.row, equals(1));
      expect(cellName.text, equals('A1'));

      cellName = CellName.fromIndex(column: 1000, row: 1000);

      expect(cellName.column, equals(1000));
      expect(cellName.row, equals(1000));
      expect(cellName.text, equals('ALL1000'));
    });

    test('Cell name from string throws error', () {
      expect(() => CellName.fromString(''), throwsParserError());
      expect(() => CellName.fromString('AA'), throwsParserError());
      expect(() => CellName.fromString('sdA3'), throwsParserError());
      expect(() => CellName.fromString('33A'), throwsParserError());
      expect(() => CellName.fromString('3'), throwsParserError());
      expect(() => CellName.fromString('A3B'), throwsParserError());
    });

    test('Cell names are equal', () {
      var fromIndex = CellName.fromIndex(column: 30, row: 33);
      var fromString = CellName.fromString('AD33');

      expect(fromIndex == fromString, equals(true));
    });
  });
}
