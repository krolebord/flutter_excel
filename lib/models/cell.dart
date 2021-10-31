import 'package:flutter/foundation.dart';
import 'package:flutter_excel/models/cell_data.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';

class Cell with ChangeNotifier {
  ColumnStyle _columnStyle;
  RowStyle _rowStyle;
  CellData _data;

  Cell({
    required ColumnStyle columnStyle,
    required RowStyle rowStyle,
    required CellData data
  }) :
    _columnStyle = columnStyle,
    _rowStyle = rowStyle,
    _data = data;

  ColumnStyle get columnStyle => _columnStyle;

  set columnStyle(ColumnStyle style) {
    _columnStyle = style;
    notifyListeners();
  }

  RowStyle get rowStyle => _rowStyle;

  set rowStyle(RowStyle style) {
    _rowStyle = style;
    notifyListeners();
  }

  CellData get data => _data;

  set data(CellData data) {
    _data = data;
    notifyListeners();
  }
}
