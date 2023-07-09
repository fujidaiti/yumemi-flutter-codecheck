import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_overview_tile.dart';
import 'package:yumemi_flutter_codecheck/screens/repository_details.dart';
import 'package:yumemi_flutter_codecheck/screens/search.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/get_repository.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

void main() {
  testWidgets(
    "リポジトリの概要をタップすると詳細画面に遷移する",
    (tester) async {
      // テスト用プロバイダー
      final overrides = [
        repositoryProvider.overrideWithProvider(_testRepositoryProvider),
        repositoriesProvider.overrideWithProvider(_testRepositoriesProvider),
      ];

      // 検索画面を表示
      await tester.pumpWidget(
        ProviderScope(
          overrides: overrides,
          child: const _TestWidget(
            SearchQuery(keywords: "flutter"),
          ),
        ),
      );

      // 検索結果の読み込み完了を待つ
      await tester.pumpAndSettle();
      final firstItem = find.byType(RepositoryOverviewTile).first;

      expect(firstItem, findsOneWidget);

      // 先頭のリストアイテムをタップ
      await tester.tap(firstItem);
      // 画面遷移の完了を待つ
      await tester.pumpAndSettle();

      expect(find.byType(RepositoryDetails), findsOneWidget);
    },
  );
}

GoRouter _testRouter(SearchQuery query) {
  return GoRouter(
    initialLocation: "/search",
    routes: [
      GoRoute(
        path: "/search",
        builder: (context, state) {
          return Search(query: query);
        },
      ),
      GoRoute(
        path: "/repository/:owner/:name",
        builder: (context, state) {
          return RepositoryDetails(
            name: state.pathParameters["name"]!,
            owner: state.pathParameters["owner"]!,
          );
        },
      ),
    ],
  );
}

class _TestWidget extends StatelessWidget {
  const _TestWidget(this.query);

  final SearchQuery query;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _testRouter(query),
    );
  }
}

final _testRepositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) {
    return Future.value(
      const Repository(
        name: "flutter",
        owner: "flutter",
        avatarUrl: null,
        description: null,
        stargazersCount: 0,
        watchersCount: 0,
        forksCount: 0,
        openIssuesCount: 0,
        openPullRequestsCount: 0,
        languages: {},
      ),
    );
  },
);

final _testRepositoriesProvider = FutureProvider.autoDispose.family(
  (ref, RepositoriesProviderParams params) async {
    const totalCount = 1;
    const result = [
      RepositoryOverview(
        name: "flutter",
        owner: "flutter",
        description: null,
        avatarUrl: null,
        language: null,
        stars: 0,
      ),
    ];

    return (totalCount, result);
  },
);
