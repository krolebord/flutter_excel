import 'package:flutter_excel/cubits/table_selection/table_selection_cubit.dart';
import 'package:flutter_excel/helpers/cast_or_null.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/column_data.dart';
import 'package:flutter_excel/models/table/row_data.dart';

extension TableSelectionStateExtensions on TableSelectionState {
  bool isColumnSelected(ColumnData data) {
    final state = castOrNull<TableSelectionColumnState>(this);
    return state != null && state.data == data;
  }

  bool isRowSelected(RowData data) {
    final state = castOrNull<TableSelectionRowState>(this);
    return state != null && state.data == data;
  }

  bool isCellSelected(CellData data) {
    final state = castOrNull<TableSelectionCellState>(this);
    return state != null && state.cell == data;
  }
}
