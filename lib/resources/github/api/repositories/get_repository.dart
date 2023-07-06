// ドキュメント ↓
// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#get-a-repository
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';
import 'package:yumemi_flutter_codecheck/resources/github/exceptions.dart';

Future<GetRepositoryResult> getRepository({
  required String name,
  required String owner,
}) async {
  return parseResponse(
    await GitHubApiClient().getJson(
      endpoint: "/repos/$owner/$name",
    ),
  );
}

typedef GetRepositoryResult = ({
  String name,
  String owner,
  String avatarUrl,
  String? description,
  String? language,
  int stargazersCount,
  int watchersCount,
  int forksCount,
  int openIssuesAndPullRequestsCount,
});

GetRepositoryResult parseResponse(Map<String, dynamic> response) {
  return switch (response) {
    {
      "name": String name,
      "description": String? description,
      "language": String? language,
      "stargazers_count": int stargazersCount,
      "forks_count": int forksCount,
      // "subscribers_count"の値がGitHub上で表示される"3.5k watching"の値に対応する（"watchers_count"ではない）
      // https://github.com/orgs/community/discussions/24795#discussioncomment-3245470
      "subscribers_count": int watchersCount,
      "open_issues": int openIssuesAndPullRequestsCount,
      "owner": {
        "login": String owner,
        "avatar_url": String avatarUrl,
      },
    } =>
      (
        name: name,
        owner: owner,
        avatarUrl: avatarUrl,
        description: description,
        language: language,
        stargazersCount: stargazersCount,
        watchersCount: watchersCount,
        forksCount: forksCount,
        openIssuesAndPullRequestsCount: openIssuesAndPullRequestsCount,
      ),
    _ => throw UnexpectedJsonResponseException(json: response),
  };
}
