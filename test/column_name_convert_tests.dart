import 'package:flutter_excel/helpers/index_converters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers/throws_parser_error.dart';

void main() {
  group('Column name convert', () {

    test('Index from column name is correct', () {
      expect(columnNameFromInt(1), 'A');
      expect(columnNameFromInt(26), 'Z');
      expect(columnNameFromInt(27), 'AA');
      expect(columnNameFromInt(28), 'AB');
      expect(columnNameFromInt(1000), 'ALL');
    });

    test('Index to column name throws exception', () {
      expect(() => columnNameFromInt(-1), throwsParserError());
      expect(() => columnNameFromInt(0), throwsParserError());
    });

    test('Index to column name is correct', () {
      expect(columnNameToInt('A'), 1);
      expect(columnNameToInt('Z'), 26);
      expect(columnNameToInt('AA'), 27);
      expect(columnNameToInt('AB'), 28);
      expect(columnNameToInt('ALL'), 1000);
    });

    test('Column name to index throws exception', () {
      expect(() => columnNameToInt('1'), throwsParserError());
      expect(() => columnNameToInt('AABBa2'), throwsParserError());
      expect(() => columnNameToInt('LLa_b'), throwsParserError());
      expect(() => columnNameToInt('LULƒ'), throwsParserError());
      expect(() => columnNameToInt(''), throwsParserError());
    });

  });
}
