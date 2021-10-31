import 'package:freezed_annotation/freezed_annotation.dart';

part 'pair.freezed.dart';

@freezed
class Pair<T1, T2> with _$Pair<T1, T2> {
  const factory Pair(T1 first, T2 second) = _Pair;
}
