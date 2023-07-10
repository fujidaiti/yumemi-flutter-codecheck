import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/get_repository.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';

import '../utils/mock_http_client.dart';
import 'data/test_get_repository_response.dart';

const _testGetRepositoryRequeestUrl =
    "https://api.github.com/repos/flutter/flutter";

const _testGetRepositoryRequestHeader = {
  "accept": "application/vnd.github+json"
};

void main() {
  group("getRepository", () {
    test("正しいクエリからリポジトリの詳細を取得しパースできる", () async {
      final mockHttp = MockClient();
      when(
        mockHttp.get(
          Uri.parse(_testGetRepositoryRequeestUrl),
          headers: _testGetRepositoryRequestHeader,
        ),
      ).thenAnswer(
        (_) async => http.Response(testGetRepositoryResponse, 200),
      );

      final result = await getRepository(
        name: "flutter",
        owner: "flutter",
        client: GitHubApiClient(mockHttp),
      );

      const GetRepositoryResult expected = (
        name: "flutter",
        owner: "flutter",
        avatarUrl: "https://avatars.githubusercontent.com/u/14101776?v=4",
        description:
            "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
        language: "Dart",
        stargazersCount: 154843,
        watchersCount: 3548,
        forksCount: 25628,
        openIssuesAndPullRequestsCount: 11609,
      );

      expect(result, expected);
    });
  });
}
