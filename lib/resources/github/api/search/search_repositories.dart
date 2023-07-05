import 'package:meta/meta.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';

// ドキュメント ↓
// https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-repositories
Future<SearchRepositoriesResult> searchRepositories({
  required String query,
  required int page,
  required int perPage,
}) async {
  return parseResponse(
    await GitHubApiClient().getJson(
      endpoint: "/search/repositories",
      queryParameters: {
        "q": query,
        "page": "$page",
        "per_page": "$perPage",
      },
    ),
  );
}

typedef SearchRepositoriesResult = ({
  int totalCount,
  List<RepositoryOverview> items,
});

@visibleForTesting
typedef RepositoryOverview = ({
  String name,
  String owner,
  String avatarUrl,
  String? description,
  String? language,
  int stargazersCount,
});

@visibleForTesting
SearchRepositoriesResult parseResponse(Map<String, dynamic> response) {
  return switch (response) {
    {
      "total_count": int totalCount,
      "items": List<dynamic> items,
    } =>
      (
        totalCount: totalCount,
        items: [...items.map(parseItem)],
      ),
    // TODO; 例外処理
    _ => throw UnimplementedError(
        "[search-repositories] 無効なデータ形式: $response",
      ),
  };
}

@visibleForTesting
RepositoryOverview parseItem(dynamic item) {
  return switch (item) {
    {
      "name": String name,
      "description": String? description,
      "language": String? language,
      "stargazers_count": int stargazersCount,
      "owner": {
        "login": String owner,
        "avatar_url": String avatarUrl,
      },
    } =>
      (
        name: name,
        owner: owner,
        avatarUrl: avatarUrl,
        language: language,
        description: description,
        stargazersCount: stargazersCount,
      ),
    // TODO; 例外処理
    _ => throw UnimplementedError(
        "[repository-overview] 無効なデータ形式 : $item",
      ),
  };
}
