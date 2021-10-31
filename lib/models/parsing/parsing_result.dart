import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsing_result.freezed.dart';

@freezed
class ParsingResult with _$ParsingResult {
  const factory ParsingResult({
    required dynamic value,
    @Default({}) Set<CellName> referencedCells
  }) = _ParsingResult;
}
