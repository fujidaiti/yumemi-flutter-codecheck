import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_pull_requests.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';

import '../utils/mock_http_client.dart';
import 'data/test_search_pull_requests_response.dart';

const _testSearchPullRequestsRequestHeader = {
  "accept": "application/vnd.github+json",
};

const _testSearchPullRequestsRequestUrl =
    "https://api.github.com/search/issues?q=is%3Apr+state%3Aopen+repo%3Aflutter%2Fflutter&per_page=1";

void main() {
  group("searchPullRequests", () {
    test("正しいクエリからOpenなPRを検索しその件数を取得できる", () async {
      final mockHttp = MockClient();
      when(
        mockHttp.get(
          Uri.parse(_testSearchPullRequestsRequestUrl),
          headers: _testSearchPullRequestsRequestHeader,
        ),
      ).thenAnswer(
        (_) async => http.Response(testSearchPullRequestsResponse, 200),
      );

      final result = await searchPullRequests(
        repository: "flutter",
        owner: "flutter",
        isOpen: true,
        client: GitHubApiClient(mockHttp),
      );

      const SearchPullRequestsResult expected = (totalCount: 152,);
      expect(result, expected);
    });
  });
}
