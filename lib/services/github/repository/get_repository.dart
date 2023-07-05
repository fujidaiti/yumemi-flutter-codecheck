import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/get_repository.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_pull_requests.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final repositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
    final result = await getRepository(
      name: params.name,
      owner: params.owner,
    );
    final openPullRequests = await searchPullRequests(
      repository: params.name,
      owner: params.owner,
      isOpen: true,
    );
    return Repository(
      name: result.name,
      owner: result.owner,
      avatarUrl: result.avatarUrl,
      description: result.description,
      language: result.language,
      stargazersCount: result.stargazersCount,
      watchersCount: result.watchersCount,
      forksCount: result.forksCount,
      openPullRequestsCount: openPullRequests.totalCount,
      openIssuesCount:
          result.openIssuesAndPullRequestsCount - openPullRequests.totalCount,
    );
  },
);
