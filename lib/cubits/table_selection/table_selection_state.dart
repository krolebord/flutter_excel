part of 'table_selection_cubit.dart';

@freezed
class TableSelectionState with _$TableSelectionState {
  const factory TableSelectionState.none() = TableSelectionNoneState;

  const factory TableSelectionState.column({
    required ColumnData data
  }) = TableSelectionColumnState;

  const factory TableSelectionState.row({
    required RowData data
  }) = TableSelectionRowState;

  const factory TableSelectionState.cell({
    required CellData cell
  }) = TableSelectionCellState;
}
