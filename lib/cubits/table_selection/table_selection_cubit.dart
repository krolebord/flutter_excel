import 'package:bloc/bloc.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/column_data.dart';
import 'package:flutter_excel/models/table/row_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'table_selection_state.dart';
part 'table_selection_cubit.freezed.dart';

class TableSelectionCubit extends Cubit<TableSelectionState> {
  TableSelectionCubit() : super(const TableSelectionState.none());
  
  void cancelSelection() {
    emit(const TableSelectionState.none());
  }
  
  void selectColumn(ColumnData data) {
    emit(TableSelectionState.column(data: data));
  }

  void selectRow(RowData data) {
    emit(TableSelectionState.row(data: data));
  }
  
  void selectCell(CellData data) {
    emit(TableSelectionState.cell(cell: data));
  }
}
