import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/repositories/list_repository_languages.dart';

import 'data/test_list_repository_languages_response.dart';

void main() {
  group("parseResponse", () {
    test("正しいフォーマットのJsonをパースできる", () {
      final response = jsonDecode(testListRepositoryLanguagesResponse);
      final result = parseResponse(response);
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
