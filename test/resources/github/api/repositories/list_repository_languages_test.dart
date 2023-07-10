import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/list_repository_languages.dart';
import 'package:yumemi_flutter_codecheck/resources/github/client.dart';

import '../utils/mock_http_client.dart';
import 'data/test_list_repository_languages_response.dart';

const _testListRepositoryLanguagesRequeestUrl =
    "https://api.github.com/repos/flutter/flutter/languages";

const _testListRepositoryLanguagesRequestHeader = {
  "accept": "application/vnd.github+json"
};

void main() {
  group("listRepositoryLanguages", () {
    test("正しいクエリからリポジトリの言語一覧を取得しパースできる", () async {
      final mockHttp = MockClient();
      when(
        mockHttp.get(
          Uri.parse(_testListRepositoryLanguagesRequeestUrl),
          headers: _testListRepositoryLanguagesRequestHeader,
        ),
      ).thenAnswer(
        (_) async => http.Response(testListRepositoryLanguagesResponse, 200),
      );

      final result = await listRepositoryLanguages(
        repository: "flutter",
        owner: "flutter",
        client: GitHubApiClient(mockHttp),
      );

      final ListRepositoryLanguagesResult expected = {
        "Dart": 56432459,
        "C++": 129682,
        "Objective-C": 101371,
        "Java": 86110,
        "CMake": 75062,
        "Groovy": 62798,
        "Shell": 51273,
        "Ruby": 42689,
        "HTML": 30762,
        "JavaScript": 24454,
        "Swift": 22456,
        "Batchfile": 16351,
        "Kotlin": 11575,
        "CSS": 5831,
        "Dockerfile": 5473,
        "C": 5464,
        "PowerShell": 4194,
        "GLSL": 3963
      };
      expect(result, expected);
    });
  });
}
