import 'package:flutter/foundation.dart';
import 'package:flutter_excel/models/row_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_style.freezed.dart';

@freezed
class TableStyle with _$TableStyle {
  const factory TableStyle({
    required double headerHeight,
    required double sidebarWidth,

    @Default(RowStyle(height: 10)) RowStyle defaultRowStyle,

  }) = _TableStyle;
}
