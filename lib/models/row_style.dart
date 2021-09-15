import 'package:freezed_annotation/freezed_annotation.dart';

part 'row_style.freezed.dart';

@freezed
class RowStyle with _$RowStyle {
  const factory RowStyle({
    required double height
  }) = _RowStyle;
}
