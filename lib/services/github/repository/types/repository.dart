import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repository.freezed.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required String name,
    required String owner,
    required String avatarUrl,
    required String? description,
    required String? language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
  }) = _Repository;
}