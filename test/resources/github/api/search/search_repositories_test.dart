import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_repositories.dart';

void main() {
  group("parseItem", () {
    test(
      '正しいフォーマットのデータをパースできる',
      () {
        const repoName = "flutter";
        const repoDescription = "hoge";
        const language = "Dart";
        const stars = 100;
        const ownerName = "flutter";
        const ownerAvatarUrl = "http";

        final input = {
          "name": repoName,
          "description": repoDescription,
          "language": language,
          "stargazers_count": stars,
          "owner": {
            "login": ownerName,
            "avatar_url": ownerAvatarUrl,
          },
        };

        RepositoryOverview expected = (
          name: repoName,
          description: repoDescription,
          language: language,
          stargazersCount: stars,
          owner: ownerName,
          avatarUrl: ownerAvatarUrl,
        );

        expect(parseItem(input), expected);
      },
    );
  });
}
