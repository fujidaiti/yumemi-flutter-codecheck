import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final fakeRepositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
    await Future.delayed(const Duration(milliseconds: 750));
    return Repository(
      name: params.name,
      owner: params.owner,
      avatarUrl: "https://avatars.githubusercontent.com/u/14101776?v=4",
      description: "This is the offcial repository of Flutter project",
      language: "Dart",
      stargazersCount: 20000,
      watchersCount: 100,
      forksCount: 345,
      openIssuesCount: 540,
    );
  },
);
