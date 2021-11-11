// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'table_selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TableSelectionStateTearOff {
  const _$TableSelectionStateTearOff();

  TableSelectionNoneState none() {
    return const TableSelectionNoneState();
  }

  TableSelectionColumnState column({required ColumnData data}) {
    return TableSelectionColumnState(
      data: data,
    );
  }

  TableSelectionRowState row({required RowData data}) {
    return TableSelectionRowState(
      data: data,
    );
  }

  TableSelectionCellState cell({required CellData cell}) {
    return TableSelectionCellState(
      cell: cell,
    );
  }
}

/// @nodoc
const $TableSelectionState = _$TableSelectionStateTearOff();

/// @nodoc
mixin _$TableSelectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColumnData data) column,
    required TResult Function(RowData data) row,
    required TResult Function(CellData cell) cell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColumnData data)? column,
    TResult Function(RowData data)? row,
    TResult Function(CellData cell)? cell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableSelectionNoneState value) none,
    required TResult Function(TableSelectionColumnState value) column,
    required TResult Function(TableSelectionRowState value) row,
    required TResult Function(TableSelectionCellState value) cell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableSelectionNoneState value)? none,
    TResult Function(TableSelectionColumnState value)? column,
    TResult Function(TableSelectionRowState value)? row,
    TResult Function(TableSelectionCellState value)? cell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableSelectionStateCopyWith<$Res> {
  factory $TableSelectionStateCopyWith(
          TableSelectionState value, $Res Function(TableSelectionState) then) =
      _$TableSelectionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableSelectionStateCopyWithImpl<$Res>
    implements $TableSelectionStateCopyWith<$Res> {
  _$TableSelectionStateCopyWithImpl(this._value, this._then);

  final TableSelectionState _value;
  // ignore: unused_field
  final $Res Function(TableSelectionState) _then;
}

/// @nodoc
abstract class $TableSelectionNoneStateCopyWith<$Res> {
  factory $TableSelectionNoneStateCopyWith(TableSelectionNoneState value,
          $Res Function(TableSelectionNoneState) then) =
      _$TableSelectionNoneStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableSelectionNoneStateCopyWithImpl<$Res>
    extends _$TableSelectionStateCopyWithImpl<$Res>
    implements $TableSelectionNoneStateCopyWith<$Res> {
  _$TableSelectionNoneStateCopyWithImpl(TableSelectionNoneState _value,
      $Res Function(TableSelectionNoneState) _then)
      : super(_value, (v) => _then(v as TableSelectionNoneState));

  @override
  TableSelectionNoneState get _value => super._value as TableSelectionNoneState;
}

/// @nodoc
class _$TableSelectionNoneState implements TableSelectionNoneState {
  const _$TableSelectionNoneState();

  @override
  String toString() {
    return 'TableSelectionState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TableSelectionNoneState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColumnData data) column,
    required TResult Function(RowData data) row,
    required TResult Function(CellData cell) cell,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColumnData data)? column,
    TResult Function(RowData data)? row,
    TResult Function(CellData cell)? cell,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableSelectionNoneState value) none,
    required TResult Function(TableSelectionColumnState value) column,
    required TResult Function(TableSelectionRowState value) row,
    required TResult Function(TableSelectionCellState value) cell,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableSelectionNoneState value)? none,
    TResult Function(TableSelectionColumnState value)? column,
    TResult Function(TableSelectionRowState value)? row,
    TResult Function(TableSelectionCellState value)? cell,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class TableSelectionNoneState implements TableSelectionState {
  const factory TableSelectionNoneState() = _$TableSelectionNoneState;
}

/// @nodoc
abstract class $TableSelectionColumnStateCopyWith<$Res> {
  factory $TableSelectionColumnStateCopyWith(TableSelectionColumnState value,
          $Res Function(TableSelectionColumnState) then) =
      _$TableSelectionColumnStateCopyWithImpl<$Res>;
  $Res call({ColumnData data});
}

/// @nodoc
class _$TableSelectionColumnStateCopyWithImpl<$Res>
    extends _$TableSelectionStateCopyWithImpl<$Res>
    implements $TableSelectionColumnStateCopyWith<$Res> {
  _$TableSelectionColumnStateCopyWithImpl(TableSelectionColumnState _value,
      $Res Function(TableSelectionColumnState) _then)
      : super(_value, (v) => _then(v as TableSelectionColumnState));

  @override
  TableSelectionColumnState get _value =>
      super._value as TableSelectionColumnState;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(TableSelectionColumnState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ColumnData,
    ));
  }
}

/// @nodoc
class _$TableSelectionColumnState implements TableSelectionColumnState {
  const _$TableSelectionColumnState({required this.data});

  @override
  final ColumnData data;

  @override
  String toString() {
    return 'TableSelectionState.column(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TableSelectionColumnState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $TableSelectionColumnStateCopyWith<TableSelectionColumnState> get copyWith =>
      _$TableSelectionColumnStateCopyWithImpl<TableSelectionColumnState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColumnData data) column,
    required TResult Function(RowData data) row,
    required TResult Function(CellData cell) cell,
  }) {
    return column(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColumnData data)? column,
    TResult Function(RowData data)? row,
    TResult Function(CellData cell)? cell,
    required TResult orElse(),
  }) {
    if (column != null) {
      return column(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableSelectionNoneState value) none,
    required TResult Function(TableSelectionColumnState value) column,
    required TResult Function(TableSelectionRowState value) row,
    required TResult Function(TableSelectionCellState value) cell,
  }) {
    return column(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableSelectionNoneState value)? none,
    TResult Function(TableSelectionColumnState value)? column,
    TResult Function(TableSelectionRowState value)? row,
    TResult Function(TableSelectionCellState value)? cell,
    required TResult orElse(),
  }) {
    if (column != null) {
      return column(this);
    }
    return orElse();
  }
}

abstract class TableSelectionColumnState implements TableSelectionState {
  const factory TableSelectionColumnState({required ColumnData data}) =
      _$TableSelectionColumnState;

  ColumnData get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableSelectionColumnStateCopyWith<TableSelectionColumnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableSelectionRowStateCopyWith<$Res> {
  factory $TableSelectionRowStateCopyWith(TableSelectionRowState value,
          $Res Function(TableSelectionRowState) then) =
      _$TableSelectionRowStateCopyWithImpl<$Res>;
  $Res call({RowData data});
}

/// @nodoc
class _$TableSelectionRowStateCopyWithImpl<$Res>
    extends _$TableSelectionStateCopyWithImpl<$Res>
    implements $TableSelectionRowStateCopyWith<$Res> {
  _$TableSelectionRowStateCopyWithImpl(TableSelectionRowState _value,
      $Res Function(TableSelectionRowState) _then)
      : super(_value, (v) => _then(v as TableSelectionRowState));

  @override
  TableSelectionRowState get _value => super._value as TableSelectionRowState;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(TableSelectionRowState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RowData,
    ));
  }
}

/// @nodoc
class _$TableSelectionRowState implements TableSelectionRowState {
  const _$TableSelectionRowState({required this.data});

  @override
  final RowData data;

  @override
  String toString() {
    return 'TableSelectionState.row(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TableSelectionRowState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $TableSelectionRowStateCopyWith<TableSelectionRowState> get copyWith =>
      _$TableSelectionRowStateCopyWithImpl<TableSelectionRowState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColumnData data) column,
    required TResult Function(RowData data) row,
    required TResult Function(CellData cell) cell,
  }) {
    return row(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColumnData data)? column,
    TResult Function(RowData data)? row,
    TResult Function(CellData cell)? cell,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableSelectionNoneState value) none,
    required TResult Function(TableSelectionColumnState value) column,
    required TResult Function(TableSelectionRowState value) row,
    required TResult Function(TableSelectionCellState value) cell,
  }) {
    return row(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableSelectionNoneState value)? none,
    TResult Function(TableSelectionColumnState value)? column,
    TResult Function(TableSelectionRowState value)? row,
    TResult Function(TableSelectionCellState value)? cell,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(this);
    }
    return orElse();
  }
}

abstract class TableSelectionRowState implements TableSelectionState {
  const factory TableSelectionRowState({required RowData data}) =
      _$TableSelectionRowState;

  RowData get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableSelectionRowStateCopyWith<TableSelectionRowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableSelectionCellStateCopyWith<$Res> {
  factory $TableSelectionCellStateCopyWith(TableSelectionCellState value,
          $Res Function(TableSelectionCellState) then) =
      _$TableSelectionCellStateCopyWithImpl<$Res>;
  $Res call({CellData cell});
}

/// @nodoc
class _$TableSelectionCellStateCopyWithImpl<$Res>
    extends _$TableSelectionStateCopyWithImpl<$Res>
    implements $TableSelectionCellStateCopyWith<$Res> {
  _$TableSelectionCellStateCopyWithImpl(TableSelectionCellState _value,
      $Res Function(TableSelectionCellState) _then)
      : super(_value, (v) => _then(v as TableSelectionCellState));

  @override
  TableSelectionCellState get _value => super._value as TableSelectionCellState;

  @override
  $Res call({
    Object? cell = freezed,
  }) {
    return _then(TableSelectionCellState(
      cell: cell == freezed
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as CellData,
    ));
  }
}

/// @nodoc
class _$TableSelectionCellState implements TableSelectionCellState {
  const _$TableSelectionCellState({required this.cell});

  @override
  final CellData cell;

  @override
  String toString() {
    return 'TableSelectionState.cell(cell: $cell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TableSelectionCellState &&
            (identical(other.cell, cell) ||
                const DeepCollectionEquality().equals(other.cell, cell)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cell);

  @JsonKey(ignore: true)
  @override
  $TableSelectionCellStateCopyWith<TableSelectionCellState> get copyWith =>
      _$TableSelectionCellStateCopyWithImpl<TableSelectionCellState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(ColumnData data) column,
    required TResult Function(RowData data) row,
    required TResult Function(CellData cell) cell,
  }) {
    return cell(this.cell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(ColumnData data)? column,
    TResult Function(RowData data)? row,
    TResult Function(CellData cell)? cell,
    required TResult orElse(),
  }) {
    if (cell != null) {
      return cell(this.cell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableSelectionNoneState value) none,
    required TResult Function(TableSelectionColumnState value) column,
    required TResult Function(TableSelectionRowState value) row,
    required TResult Function(TableSelectionCellState value) cell,
  }) {
    return cell(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableSelectionNoneState value)? none,
    TResult Function(TableSelectionColumnState value)? column,
    TResult Function(TableSelectionRowState value)? row,
    TResult Function(TableSelectionCellState value)? cell,
    required TResult orElse(),
  }) {
    if (cell != null) {
      return cell(this);
    }
    return orElse();
  }
}

abstract class TableSelectionCellState implements TableSelectionState {
  const factory TableSelectionCellState({required CellData cell}) =
      _$TableSelectionCellState;

  CellData get cell => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableSelectionCellStateCopyWith<TableSelectionCellState> get copyWith =>
      throw _privateConstructorUsedError;
}
