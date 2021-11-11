part of 'table_load_cubit.dart';

@freezed
class TableLoadState with _$TableLoadState {
  const factory TableLoadState.notLoaded() = TableNotLoadedState;
  const factory TableLoadState.loaded(TableData table) = TableLoadedState;
}
