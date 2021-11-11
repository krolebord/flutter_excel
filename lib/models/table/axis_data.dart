import 'package:flutter/foundation.dart';
import 'package:flutter_excel/models/table/table_data.dart';

abstract class AxisData<TStyle> extends ChangeNotifier {
  final TableData table;

  int _index;
  TStyle _style;

  AxisData({
    required int index,
    required this.table,
    required TStyle style
  }) :
    _index = index,
    _style = style;

  double get size;
  set size(double size);

  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  TStyle get style => _style;

  set style(TStyle style) {
    _style = style;
    notifyListeners();
  }
}
