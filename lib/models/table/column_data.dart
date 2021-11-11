import 'package:flutter_excel/models/table/axis_data.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';

class ColumnData extends AxisData<ColumnStyle> {
  ColumnData({
    required TableData table,
    required int index,
    required ColumnStyle style
  }) : super(
    table: table,
    index: index,
    style: style
  );

  factory ColumnData.fromJson({
    required TableData table,
    required int index,
    required dynamic json
  }) {
    return ColumnData(
      table: table,
      index: index,
      style: ColumnStyle.fromJson(json)
    );
  }

  @override
  double get size => style.width;

  @override
  set size(double size) {
    style = style.copyWith(
      width: size
    );
  }

  Map<String, dynamic> toJson() {
    return style.toJson();
  }
}
