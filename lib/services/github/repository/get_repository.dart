import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/values/percentage.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/get_repository.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/list_repository_languages.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_pull_requests.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final repositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
    final details = await getRepository(
      name: params.name,
      owner: params.owner,
    );
    final openPullRequests = await searchPullRequests(
      repository: params.name,
      owner: params.owner,
      isOpen: true,
    );
    final languages = await listRepositoryLanguages(
      repository: params.name,
      owner: params.owner,
    );

    final totalCodeBytes =
        languages.values.fold(0, (acc, bytes) => acc + bytes).toDouble();

    return Repository(
      name: details.name,
      owner: details.owner,
      avatarUrl: details.avatarUrl,
      description: details.description,
      stargazersCount: details.stargazersCount,
      watchersCount: details.watchersCount,
      forksCount: details.forksCount,
      openPullRequestsCount: openPullRequests.totalCount,
      openIssuesCount:
          details.openIssuesAndPullRequestsCount - openPullRequests.totalCount,
      languages: languages.map(
        (lang, bytes) => MapEntry(
          lang,
          Percentage.from(
            bytes.toDouble(),
            divider: totalCodeBytes,
          ),
        ),
      ),
    );
  },
);
