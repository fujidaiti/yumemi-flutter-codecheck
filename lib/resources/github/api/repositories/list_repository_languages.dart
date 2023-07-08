import 'package:meta/meta.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';
import 'package:yumemi_flutter_codecheck/resources/github/exceptions/unexpected_json_response_exception.dart';

// ドキュメント ↓
// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repository-languages
Future<ListRepositoryLanguagesResult> listRepositoryLanguages({
  required String repository,
  required String owner,
}) async {
  return parseResponse(
    await GitHubApiClient().getJson(
      endpoint: "/repos/$owner/$repository/languages",
    ),
  );
}

/// [listRepositoryLanguages]の結果を表す型（[Map]）
/// 
/// キーは言語名、値はその言語で書かれたコードのバイト数。
/// 
/// 例：
/// ```json
/// {
///   "C": 78769,
///   "Python": 7769
/// }
/// ```
typedef ListRepositoryLanguagesResult = Map<String, int>;

@visibleForTesting
ListRepositoryLanguagesResult parseResponse(Map<String, dynamic> response) {
  return switch (response) {
    Map<String, int> languages => languages,
    _ => throw UnexpectedJsonResponseException(json: response),
  };
}
