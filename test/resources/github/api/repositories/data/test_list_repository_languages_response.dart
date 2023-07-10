/// 以下のコマンドで取得：
///
/// ```shell
/// curl -L \
///   -H "Accept: application/vnd.github+json" \
///   -H "X-GitHub-Api-Version: 2022-11-28" \
///   "https://api.github.com/repos/flutter/flutter/languages"
/// ```
const testListRepositoryLanguagesResponse = r'''
{
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
}
''';
