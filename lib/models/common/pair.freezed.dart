// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PairTearOff {
  const _$PairTearOff();

  _Pair<T1, T2> call<T1, T2>(T1 first, T2 second) {
    return _Pair<T1, T2>(
      first,
      second,
    );
  }
}

/// @nodoc
const $Pair = _$PairTearOff();

/// @nodoc
mixin _$Pair<T1, T2> {
  T1 get first => throw _privateConstructorUsedError;
  T2 get second => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PairCopyWith<T1, T2, Pair<T1, T2>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairCopyWith<T1, T2, $Res> {
  factory $PairCopyWith(Pair<T1, T2> value, $Res Function(Pair<T1, T2>) then) =
      _$PairCopyWithImpl<T1, T2, $Res>;
  $Res call({T1 first, T2 second});
}

/// @nodoc
class _$PairCopyWithImpl<T1, T2, $Res> implements $PairCopyWith<T1, T2, $Res> {
  _$PairCopyWithImpl(this._value, this._then);

  final Pair<T1, T2> _value;
  // ignore: unused_field
  final $Res Function(Pair<T1, T2>) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as T1,
      second: second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as T2,
    ));
  }
}

/// @nodoc
abstract class _$PairCopyWith<T1, T2, $Res>
    implements $PairCopyWith<T1, T2, $Res> {
  factory _$PairCopyWith(
          _Pair<T1, T2> value, $Res Function(_Pair<T1, T2>) then) =
      __$PairCopyWithImpl<T1, T2, $Res>;
  @override
  $Res call({T1 first, T2 second});
}

/// @nodoc
class __$PairCopyWithImpl<T1, T2, $Res> extends _$PairCopyWithImpl<T1, T2, $Res>
    implements _$PairCopyWith<T1, T2, $Res> {
  __$PairCopyWithImpl(_Pair<T1, T2> _value, $Res Function(_Pair<T1, T2>) _then)
      : super(_value, (v) => _then(v as _Pair<T1, T2>));

  @override
  _Pair<T1, T2> get _value => super._value as _Pair<T1, T2>;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_Pair<T1, T2>(
      first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as T1,
      second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as T2,
    ));
  }
}

/// @nodoc
class _$_Pair<T1, T2> implements _Pair<T1, T2> {
  const _$_Pair(this.first, this.second);

  @override
  final T1 first;
  @override
  final T2 second;

  @override
  String toString() {
    return 'Pair<$T1, $T2>(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pair<T1, T2> &&
            (identical(other.first, first) ||
                const DeepCollectionEquality().equals(other.first, first)) &&
            (identical(other.second, second) ||
                const DeepCollectionEquality().equals(other.second, second)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(first) ^
      const DeepCollectionEquality().hash(second);

  @JsonKey(ignore: true)
  @override
  _$PairCopyWith<T1, T2, _Pair<T1, T2>> get copyWith =>
      __$PairCopyWithImpl<T1, T2, _Pair<T1, T2>>(this, _$identity);
}

abstract class _Pair<T1, T2> implements Pair<T1, T2> {
  const factory _Pair(T1 first, T2 second) = _$_Pair<T1, T2>;

  @override
  T1 get first => throw _privateConstructorUsedError;
  @override
  T2 get second => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PairCopyWith<T1, T2, _Pair<T1, T2>> get copyWith =>
      throw _privateConstructorUsedError;
}
