import 'package:freezed_annotation/freezed_annotation.dart';

part 'row_style.freezed.dart';
part 'row_style.g.dart';

@freezed
class RowStyle with _$RowStyle {
  @JsonSerializable()
  const factory RowStyle({
    required double height
  }) = _RowStyle;

  factory RowStyle.fromJson(Map<String, dynamic> json) => _$RowStyleFromJson(json);
}
