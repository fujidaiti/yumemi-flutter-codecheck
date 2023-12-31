import 'package:meta/meta.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';
import 'package:yumemi_flutter_codecheck/resources/github/exceptions/unexpected_json_response_exception.dart';

// ドキュメント ↓
// https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-issues-and-pull-requests
Future<SearchPullRequestsResult> searchPullRequests({
  required String repository,
  required String owner,
  required bool isOpen,
  GitHubApiClient? client,
}) async {
  final state = isOpen ? "open" : "closed";
  return parseResponse(
    await (client ?? GitHubApiClient()).getJson(
      endpoint: "search/issues",
      queryParameters: {
        // 今の所検索結果の数だけ欲しいので`per_page=1`とする
        "q": "is:pr state:$state repo:$owner/$repository",
        "per_page": "1",
      },
    ),
  );
}

typedef SearchPullRequestsResult = ({
  int totalCount,
});

@visibleForTesting
SearchPullRequestsResult parseResponse(Map<String, dynamic> response) {
  return switch (response) {
    {"total_count": int totalCount} => (totalCount: totalCount),
    _ => throw UnexpectedJsonResponseException(json: response),
  };
}
