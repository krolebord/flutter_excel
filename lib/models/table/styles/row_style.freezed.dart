// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'row_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RowStyle _$RowStyleFromJson(Map<String, dynamic> json) {
  return _RowStyle.fromJson(json);
}

/// @nodoc
class _$RowStyleTearOff {
  const _$RowStyleTearOff();

  _RowStyle call({required double height}) {
    return _RowStyle(
      height: height,
    );
  }

  RowStyle fromJson(Map<String, Object> json) {
    return RowStyle.fromJson(json);
  }
}

/// @nodoc
const $RowStyle = _$RowStyleTearOff();

/// @nodoc
mixin _$RowStyle {
  double get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowStyleCopyWith<RowStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowStyleCopyWith<$Res> {
  factory $RowStyleCopyWith(RowStyle value, $Res Function(RowStyle) then) =
      _$RowStyleCopyWithImpl<$Res>;
  $Res call({double height});
}

/// @nodoc
class _$RowStyleCopyWithImpl<$Res> implements $RowStyleCopyWith<$Res> {
  _$RowStyleCopyWithImpl(this._value, this._then);

  final RowStyle _value;
  // ignore: unused_field
  final $Res Function(RowStyle) _then;

  @override
  $Res call({
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$RowStyleCopyWith<$Res> implements $RowStyleCopyWith<$Res> {
  factory _$RowStyleCopyWith(_RowStyle value, $Res Function(_RowStyle) then) =
      __$RowStyleCopyWithImpl<$Res>;
  @override
  $Res call({double height});
}

/// @nodoc
class __$RowStyleCopyWithImpl<$Res> extends _$RowStyleCopyWithImpl<$Res>
    implements _$RowStyleCopyWith<$Res> {
  __$RowStyleCopyWithImpl(_RowStyle _value, $Res Function(_RowStyle) _then)
      : super(_value, (v) => _then(v as _RowStyle));

  @override
  _RowStyle get _value => super._value as _RowStyle;

  @override
  $Res call({
    Object? height = freezed,
  }) {
    return _then(_RowStyle(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RowStyle implements _RowStyle {
  const _$_RowStyle({required this.height});

  factory _$_RowStyle.fromJson(Map<String, dynamic> json) =>
      _$_$_RowStyleFromJson(json);

  @override
  final double height;

  @override
  String toString() {
    return 'RowStyle(height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RowStyle &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(height);

  @JsonKey(ignore: true)
  @override
  _$RowStyleCopyWith<_RowStyle> get copyWith =>
      __$RowStyleCopyWithImpl<_RowStyle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RowStyleToJson(this);
  }
}

abstract class _RowStyle implements RowStyle {
  const factory _RowStyle({required double height}) = _$_RowStyle;

  factory _RowStyle.fromJson(Map<String, dynamic> json) = _$_RowStyle.fromJson;

  @override
  double get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RowStyleCopyWith<_RowStyle> get copyWith =>
      throw _privateConstructorUsedError;
}
