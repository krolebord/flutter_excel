// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'table_load_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TableLoadStateTearOff {
  const _$TableLoadStateTearOff();

  TableNotLoadedState notLoaded() {
    return const TableNotLoadedState();
  }

  TableLoadedState loaded(TableData table) {
    return TableLoadedState(
      table,
    );
  }
}

/// @nodoc
const $TableLoadState = _$TableLoadStateTearOff();

/// @nodoc
mixin _$TableLoadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(TableData table) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(TableData table)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableNotLoadedState value) notLoaded,
    required TResult Function(TableLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableNotLoadedState value)? notLoaded,
    TResult Function(TableLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableLoadStateCopyWith<$Res> {
  factory $TableLoadStateCopyWith(
          TableLoadState value, $Res Function(TableLoadState) then) =
      _$TableLoadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableLoadStateCopyWithImpl<$Res>
    implements $TableLoadStateCopyWith<$Res> {
  _$TableLoadStateCopyWithImpl(this._value, this._then);

  final TableLoadState _value;
  // ignore: unused_field
  final $Res Function(TableLoadState) _then;
}

/// @nodoc
abstract class $TableNotLoadedStateCopyWith<$Res> {
  factory $TableNotLoadedStateCopyWith(
          TableNotLoadedState value, $Res Function(TableNotLoadedState) then) =
      _$TableNotLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableNotLoadedStateCopyWithImpl<$Res>
    extends _$TableLoadStateCopyWithImpl<$Res>
    implements $TableNotLoadedStateCopyWith<$Res> {
  _$TableNotLoadedStateCopyWithImpl(
      TableNotLoadedState _value, $Res Function(TableNotLoadedState) _then)
      : super(_value, (v) => _then(v as TableNotLoadedState));

  @override
  TableNotLoadedState get _value => super._value as TableNotLoadedState;
}

/// @nodoc
class _$TableNotLoadedState implements TableNotLoadedState {
  const _$TableNotLoadedState();

  @override
  String toString() {
    return 'TableLoadState.notLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TableNotLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(TableData table) loaded,
  }) {
    return notLoaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(TableData table)? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableNotLoadedState value) notLoaded,
    required TResult Function(TableLoadedState value) loaded,
  }) {
    return notLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableNotLoadedState value)? notLoaded,
    TResult Function(TableLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded(this);
    }
    return orElse();
  }
}

abstract class TableNotLoadedState implements TableLoadState {
  const factory TableNotLoadedState() = _$TableNotLoadedState;
}

/// @nodoc
abstract class $TableLoadedStateCopyWith<$Res> {
  factory $TableLoadedStateCopyWith(
          TableLoadedState value, $Res Function(TableLoadedState) then) =
      _$TableLoadedStateCopyWithImpl<$Res>;
  $Res call({TableData table});
}

/// @nodoc
class _$TableLoadedStateCopyWithImpl<$Res>
    extends _$TableLoadStateCopyWithImpl<$Res>
    implements $TableLoadedStateCopyWith<$Res> {
  _$TableLoadedStateCopyWithImpl(
      TableLoadedState _value, $Res Function(TableLoadedState) _then)
      : super(_value, (v) => _then(v as TableLoadedState));

  @override
  TableLoadedState get _value => super._value as TableLoadedState;

  @override
  $Res call({
    Object? table = freezed,
  }) {
    return _then(TableLoadedState(
      table == freezed
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableData,
    ));
  }
}

/// @nodoc
class _$TableLoadedState implements TableLoadedState {
  const _$TableLoadedState(this.table);

  @override
  final TableData table;

  @override
  String toString() {
    return 'TableLoadState.loaded(table: $table)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TableLoadedState &&
            (identical(other.table, table) ||
                const DeepCollectionEquality().equals(other.table, table)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(table);

  @JsonKey(ignore: true)
  @override
  $TableLoadedStateCopyWith<TableLoadedState> get copyWith =>
      _$TableLoadedStateCopyWithImpl<TableLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(TableData table) loaded,
  }) {
    return loaded(table);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(TableData table)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(table);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableNotLoadedState value) notLoaded,
    required TResult Function(TableLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableNotLoadedState value)? notLoaded,
    TResult Function(TableLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TableLoadedState implements TableLoadState {
  const factory TableLoadedState(TableData table) = _$TableLoadedState;

  TableData get table => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableLoadedStateCopyWith<TableLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
