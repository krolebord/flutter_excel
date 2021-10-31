import 'dart:math';

import 'package:flutter_excel/helpers/regex_match_extensions.dart';
import 'package:flutter_excel/models/common/pair.dart';
import 'package:flutter_excel/models/exceptions/column_name_parsing_error.dart';
import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';

int columnNameToInt(String columnName) {
  if (columnName.isEmpty) {
    throw CellParserError('Column name must not be empty');
  }

  int index = 0;

  final unitOffset = 'A'.codeUnitAt(0);
  final maxUnit = 'Z'.codeUnitAt(0);

  for (int i = 0; i < columnName.length; ++i) {
    final char = columnName.codeUnitAt(i);

    if (char < unitOffset || char > maxUnit) {
      throw ColumnNameParsingError('Char ${columnName[i]} cannot be converted');
    }

    final modulo = char - unitOffset;
    index += (pow(26, columnName.length - 1 - i) * (modulo + 1)).toInt();
  }

  return index;
}

String columnNameFromInt(int index) {
  if (index <= 0) {
    throw ColumnNameParsingError('Index must be greater than 0');
  }

  var columnName = '';

  while (index > 0)
  {
    int modulo = (index - 1) % 26;

    final char = String.fromCharCode('A'.codeUnitAt(0) + modulo);
    columnName = char + columnName;

    index = (index - modulo) ~/ 26;
  }

  return columnName;
}

late final cellNameRegEx = RegExp(
  r'(?<column>([A-Z])+)(?<row>([1-9]\d*)+)',
  caseSensitive: true,
  multiLine: false
);

Pair<int, int> cellNameToIndex(String cellName) {
  final match = cellNameRegEx.firstMatch(cellName);

  if(match == null || !match.isFull()) {
    throw CellParserError('Invalid cell name');
  }

  final columnString = match.namedGroup('column')!;
  final column = columnNameToInt(columnString);

  final rowString = match.namedGroup('row')!;
  final row = int.tryParse(rowString);

  if(row == null) {
    throw CellParserError('Invalid row');
  }

  return Pair(column, row);
}

String cellNameFromIndex({required int column, required int row}) {
  if(column <= 0) {
    throw CellParserError('Column must be greater than 0');
  }

  if(row <= 0) {
    throw CellParserError('Row must be greater than 0');
  }

  return columnNameFromInt(column) + row.toString();
}
