import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repository_overview.freezed.dart';

@freezed
class RepositoryOverview with _$RepositoryOverview {
  const factory RepositoryOverview({
    required String name,
    required String? description,
    required String owner,
    required String? avatarUrl,
    required String? language,
    required int stars,
  }) = _RepositoryOverview;
}
