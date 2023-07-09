import 'package:freezed_annotation/freezed_annotation.dart';

part 'percentage.freezed.dart';

/// 百分率
@freezed
class Percentage with _$Percentage {
  factory Percentage.from(
    double value, {
    required double divider,
  }) {
    assert(!value.isNegative);
    assert(divider > 0.0);
    assert(value <= divider);
    final fraction = value / divider;
    return Percentage._(fraction * 100);
  }

  factory Percentage(double value) {
    assert(value >= 0 && value <= 100);
    return Percentage._(value);
  }

  const factory Percentage._(double value) = _Percentage;
}
