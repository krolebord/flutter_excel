import 'package:flutter_excel/models/table/axis_data.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';

class RowData extends AxisData<RowStyle> {
  RowData({
    required TableData table,
    required int index,
    required RowStyle style
  }) : super(
    table: table,
    index: index,
    style: style
  );

  factory RowData.fromJson({
    required TableData table,
    required int index,
    required dynamic json
  }) {
    return RowData(
        table: table,
        index: index,
        style: RowStyle.fromJson(json)
    );
  }

  @override
  double get size => style.height;

  @override
  set size(double size) {
    style = style.copyWith(
      height: size
    );
  }

  Map<String, dynamic> toJson() {
    return style.toJson();
  }
}
