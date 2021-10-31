// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'parsing_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ParsingResultTearOff {
  const _$ParsingResultTearOff();

  _ParsingResult call(
      {required dynamic value, Set<CellName> referencedCells = const {}}) {
    return _ParsingResult(
      value: value,
      referencedCells: referencedCells,
    );
  }
}

/// @nodoc
const $ParsingResult = _$ParsingResultTearOff();

/// @nodoc
mixin _$ParsingResult {
  dynamic get value => throw _privateConstructorUsedError;
  Set<CellName> get referencedCells => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParsingResultCopyWith<ParsingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParsingResultCopyWith<$Res> {
  factory $ParsingResultCopyWith(
          ParsingResult value, $Res Function(ParsingResult) then) =
      _$ParsingResultCopyWithImpl<$Res>;
  $Res call({dynamic value, Set<CellName> referencedCells});
}

/// @nodoc
class _$ParsingResultCopyWithImpl<$Res>
    implements $ParsingResultCopyWith<$Res> {
  _$ParsingResultCopyWithImpl(this._value, this._then);

  final ParsingResult _value;
  // ignore: unused_field
  final $Res Function(ParsingResult) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? referencedCells = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      referencedCells: referencedCells == freezed
          ? _value.referencedCells
          : referencedCells // ignore: cast_nullable_to_non_nullable
              as Set<CellName>,
    ));
  }
}

/// @nodoc
abstract class _$ParsingResultCopyWith<$Res>
    implements $ParsingResultCopyWith<$Res> {
  factory _$ParsingResultCopyWith(
          _ParsingResult value, $Res Function(_ParsingResult) then) =
      __$ParsingResultCopyWithImpl<$Res>;
  @override
  $Res call({dynamic value, Set<CellName> referencedCells});
}

/// @nodoc
class __$ParsingResultCopyWithImpl<$Res>
    extends _$ParsingResultCopyWithImpl<$Res>
    implements _$ParsingResultCopyWith<$Res> {
  __$ParsingResultCopyWithImpl(
      _ParsingResult _value, $Res Function(_ParsingResult) _then)
      : super(_value, (v) => _then(v as _ParsingResult));

  @override
  _ParsingResult get _value => super._value as _ParsingResult;

  @override
  $Res call({
    Object? value = freezed,
    Object? referencedCells = freezed,
  }) {
    return _then(_ParsingResult(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      referencedCells: referencedCells == freezed
          ? _value.referencedCells
          : referencedCells // ignore: cast_nullable_to_non_nullable
              as Set<CellName>,
    ));
  }
}

/// @nodoc
class _$_ParsingResult implements _ParsingResult {
  const _$_ParsingResult(
      {required this.value, this.referencedCells = const {}});

  @override
  final dynamic value;
  @JsonKey(defaultValue: const {})
  @override
  final Set<CellName> referencedCells;

  @override
  String toString() {
    return 'ParsingResult(value: $value, referencedCells: $referencedCells)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParsingResult &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.referencedCells, referencedCells) ||
                const DeepCollectionEquality()
                    .equals(other.referencedCells, referencedCells)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(referencedCells);

  @JsonKey(ignore: true)
  @override
  _$ParsingResultCopyWith<_ParsingResult> get copyWith =>
      __$ParsingResultCopyWithImpl<_ParsingResult>(this, _$identity);
}

abstract class _ParsingResult implements ParsingResult {
  const factory _ParsingResult(
      {required dynamic value,
      Set<CellName> referencedCells}) = _$_ParsingResult;

  @override
  dynamic get value => throw _privateConstructorUsedError;
  @override
  Set<CellName> get referencedCells => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ParsingResultCopyWith<_ParsingResult> get copyWith =>
      throw _privateConstructorUsedError;
}
