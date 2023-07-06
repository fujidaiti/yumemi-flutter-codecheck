import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/resources/github/api/search/search_pull_requests.dart';

import 'data/test_search_pull_requests_response.dart';

void main() {
  group("parseResponse", () {
    test("正しいフォーマットのレスポンスをパースできる", () {
      final result = parseResponse(testSearchPullRequestsResponse);
      const SearchPullRequestsResult expected = (totalCount: 152,);
      expect(result, expected);
    });
  });
}
