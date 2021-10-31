import 'package:flutter_excel/helpers/index_converters.dart';

class CellName {
  final int row;
  final int column;
  final String text;

  const CellName._({
    required this.row,
    required this.column,
    required this.text
  });

  factory CellName.fromString(String cellName) {
    final cellIndex = cellNameToIndex(cellName);

    return CellName._(
      column: cellIndex.first,
      row: cellIndex.second,
      text: cellName
    );
  }

  factory CellName.fromIndex({required int column, required int row}) {
    return CellName._(
      row: row,
      column: column,
      text: cellNameFromIndex(column: column, row: row)
    );
  }

  @override
  String toString() => text;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CellName &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          column == other.column &&
          text == other.text;

  @override
  int get hashCode => row.hashCode ^ column.hashCode ^ text.hashCode;
}
