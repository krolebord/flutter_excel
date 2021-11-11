// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'column_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColumnStyle _$ColumnStyleFromJson(Map<String, dynamic> json) {
  return _ColumnStyle.fromJson(json);
}

/// @nodoc
class _$ColumnStyleTearOff {
  const _$ColumnStyleTearOff();

  _ColumnStyle call({required double width}) {
    return _ColumnStyle(
      width: width,
    );
  }

  ColumnStyle fromJson(Map<String, Object> json) {
    return ColumnStyle.fromJson(json);
  }
}

/// @nodoc
const $ColumnStyle = _$ColumnStyleTearOff();

/// @nodoc
mixin _$ColumnStyle {
  double get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColumnStyleCopyWith<ColumnStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnStyleCopyWith<$Res> {
  factory $ColumnStyleCopyWith(
          ColumnStyle value, $Res Function(ColumnStyle) then) =
      _$ColumnStyleCopyWithImpl<$Res>;
  $Res call({double width});
}

/// @nodoc
class _$ColumnStyleCopyWithImpl<$Res> implements $ColumnStyleCopyWith<$Res> {
  _$ColumnStyleCopyWithImpl(this._value, this._then);

  final ColumnStyle _value;
  // ignore: unused_field
  final $Res Function(ColumnStyle) _then;

  @override
  $Res call({
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ColumnStyleCopyWith<$Res>
    implements $ColumnStyleCopyWith<$Res> {
  factory _$ColumnStyleCopyWith(
          _ColumnStyle value, $Res Function(_ColumnStyle) then) =
      __$ColumnStyleCopyWithImpl<$Res>;
  @override
  $Res call({double width});
}

/// @nodoc
class __$ColumnStyleCopyWithImpl<$Res> extends _$ColumnStyleCopyWithImpl<$Res>
    implements _$ColumnStyleCopyWith<$Res> {
  __$ColumnStyleCopyWithImpl(
      _ColumnStyle _value, $Res Function(_ColumnStyle) _then)
      : super(_value, (v) => _then(v as _ColumnStyle));

  @override
  _ColumnStyle get _value => super._value as _ColumnStyle;

  @override
  $Res call({
    Object? width = freezed,
  }) {
    return _then(_ColumnStyle(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ColumnStyle with DiagnosticableTreeMixin implements _ColumnStyle {
  const _$_ColumnStyle({required this.width});

  factory _$_ColumnStyle.fromJson(Map<String, dynamic> json) =>
      _$_$_ColumnStyleFromJson(json);

  @override
  final double width;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColumnStyle(width: $width)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColumnStyle'))
      ..add(DiagnosticsProperty('width', width));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColumnStyle &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(width);

  @JsonKey(ignore: true)
  @override
  _$ColumnStyleCopyWith<_ColumnStyle> get copyWith =>
      __$ColumnStyleCopyWithImpl<_ColumnStyle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ColumnStyleToJson(this);
  }
}

abstract class _ColumnStyle implements ColumnStyle {
  const factory _ColumnStyle({required double width}) = _$_ColumnStyle;

  factory _ColumnStyle.fromJson(Map<String, dynamic> json) =
      _$_ColumnStyle.fromJson;

  @override
  double get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ColumnStyleCopyWith<_ColumnStyle> get copyWith =>
      throw _privateConstructorUsedError;
}
