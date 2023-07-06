import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_repositories.dart';

void main() {
  group("parseResponse", () {
    test(
      '正しいフォーマットのデータをパースできる',
      () {
        // TODO;　もう少しちゃんとしたデータでテストする
        const repoName = "flutter";
        const repoDescription = "hoge";
        const language = "Dart";
        const stars = 100;
        const ownerName = "flutter";
        const ownerAvatarUrl = "http";

        final response = {
          "total_count": 1,
          "items": [
            {
              "name": repoName,
              "description": repoDescription,
              "language": language,
              "stargazers_count": stars,
              "owner": {
                "login": ownerName,
                "avatar_url": ownerAvatarUrl,
              },
            }
          ],
        };

        final (:totalCount, :items) = parseResponse(response);

        expect(totalCount, 1);
        expect(items.length, 1);

        RepositoryOverview expectedItem = (
          name: repoName,
          description: repoDescription,
          language: language,
          stargazersCount: stars,
          owner: ownerName,
          avatarUrl: ownerAvatarUrl,
        );

        expect(items.first, expectedItem);
      },
    );
  });
}
