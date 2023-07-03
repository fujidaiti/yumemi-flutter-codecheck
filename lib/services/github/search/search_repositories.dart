import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

typedef _RepositoriesProviderParams = ({
  SearchQuery query,
  int page,
  int perPage,
});

final repositoriesProvider = FutureProvider.autoDispose.family(
  (ref, _RepositoriesProviderParams params) async {
    final result = await searchRepositories(
      query: params.query.keywords,
      page: params.page,
      perPage: params.perPage,
    );
    final items = [
      for (final item in result.items)
        RepositoryOverview(
          name: item.name,
          description: item.description,
          owner: item.owner,
          avatarUrl: item.avatarUrl,
          language: item.language,
          stars: item.stargazersCount,
        ),
    ];

    return (result.totalCount, items);
  },
);
