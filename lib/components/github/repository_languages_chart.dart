import 'package:flutter/material.dart';
import 'package:github_language_colors/github_language_colors.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:yumemi_flutter_codecheck/common/values/percentage.dart';

const _fallbackLanguageColor = Colors.lightGreen;

class RepositoryLanguagesChart extends StatelessWidget {
  const RepositoryLanguagesChart({
    super.key,
    required this.languages,
    this.barStyle,
    this.legendStyle,
  });

  final Map<String, Percentage> languages;
  final SegmentedBarStyle? barStyle;
  final SegmentedBarLegendStyle? legendStyle;

  @override
  Widget build(BuildContext context) {
    return PrimerProgressBar(
      barStyle: barStyle ?? const SegmentedBarStyle(),
      legendStyle: legendStyle ?? const SegmentedBarLegendStyle(),
      segments: [
        for (final MapEntry(key: langName, value: percentage)
            in languages.entries)
          Segment(
            value: percentage.value.ceil().toInt(),
            label: Text(langName),
            valueLabel: Text(_formatValue(percentage.value)),
            color: switch (githubLanguageColors[langName]) {
              int hexCode => Color(hexCode),
              null => _fallbackLanguageColor,
            },
          ),
      ],
      legendEllipsisBuilder: _buildLegendEllipsis,
    );
  }

  LegendItem _buildLegendEllipsis(int truncatedItemCount) {
    final totalPercentage = languages.values
        .skip(languages.length - truncatedItemCount)
        .fold(0.0, (acc, percentage) => acc + percentage.value);

    return LegendItem(
      segment: Segment(
        value: totalPercentage.toInt(),
        label: const Text("Other"),
        color: Colors.grey,
        valueLabel: Text(_formatValue(totalPercentage)),
      ),
    );
  }

  /// [value]を小数点以下１桁の文字列に変換する
  ///
  /// [value]が整数なら小数点はなし。
  String _formatValue(double value) {
    final rounded = value.round();
    return switch (rounded == value) {
      true => "$rounded%",
      false => "${value.toStringAsFixed(1)}%",
    };
  }
}
