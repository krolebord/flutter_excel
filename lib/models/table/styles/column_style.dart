import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'column_style.freezed.dart';

@freezed
class ColumnStyle with _$ColumnStyle {
  const factory ColumnStyle({
    required double width,
  }) = _ColumnStyle;
}
