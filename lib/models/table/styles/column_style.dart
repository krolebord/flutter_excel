import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'column_style.freezed.dart';
part 'column_style.g.dart';

@freezed
class ColumnStyle with _$ColumnStyle {
  @JsonSerializable()
  const factory ColumnStyle({
    required double width,
  }) = _ColumnStyle;

  factory ColumnStyle.fromJson(Map<String, dynamic> json) => _$ColumnStyleFromJson(json);
}
