import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_codecheck/common/values/percentage.dart';

part 'repository.freezed.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required String name,
    required String owner,
    required String? avatarUrl,
    required String? description,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
    required int openPullRequestsCount,
    required Map<String, Percentage> languages,
  }) = _Repository;
}
