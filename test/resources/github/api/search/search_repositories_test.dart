import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_repositories.dart';

import 'data/test_search_repositories_response.dart';

void main() {
  group("parseResponse", () {
    test(
      '正しいフォーマットのデータをパースできる',
      () {
        final (:totalCount, :items) =
            parseResponse(testSearchRepositoriesResponse);

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
      },
    );
  });
}
