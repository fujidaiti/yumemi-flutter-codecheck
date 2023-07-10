import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';

import '../utils/mock_http_client.dart';
import 'data/test_search_repositories_response.dart';

const _testSearchRepositoriesRequestHeader = {
  "accept": "application/vnd.github+json"
};

const _testSearchRepositoriesRequestUrl =
    "https://api.github.com/search/repositories?q=flutter&page=1&per_page=1";

void main() {
  group("searchRepositories", () {
    test('クエリからリポジトリを検索し、結果をパースできる', () async {
      final mockHttp = MockClient();
      when(
        mockHttp.get(
          Uri.parse(_testSearchRepositoriesRequestUrl),
          headers: _testSearchRepositoriesRequestHeader,
        ),
      ).thenAnswer(
        (_) async => http.Response(testSearchRepositoriesResponse, 200),
      );

      final (:totalCount, :items) = await searchRepositories(
        query: "flutter",
        page: 1,
        perPage: 1,
        client: GitHubApiClient(mockHttp),
      );

      expect(totalCount, 549751);
      expect(items.length, 1);

      RepositoryOverview expectedItem = (
        name: "flutter",
        owner: "flutter",
        description:
            "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
        language: "Dart",
        avatarUrl: "https://avatars.githubusercontent.com/u/14101776?v=4",
        stargazersCount: 154797,
      );

      expect(items.first, expectedItem);
    });
  });
}
