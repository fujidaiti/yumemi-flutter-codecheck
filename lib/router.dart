import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/screens/home.dart';
import 'package:yumemi_flutter_codecheck/screens/repository_details.dart';
import 'package:yumemi_flutter_codecheck/screens/search.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) {
        return switch (state.extra) {
          SearchQuery query => Search(query: query),
          // TODO; 例外処理
          _ => throw UnimplementedError("'/search'はディープリンクに未対応"),
        };
      },
    ),
    GoRoute(
      path: "/repository/:owner/:name",
      builder: (context, state) {
        return switch (state.pathParameters) {
          {
            "name": var name,
            "owner": var owner,
          } =>
            RepositoryDetails(
              name: name,
              owner: owner,
            ),
          // TODO; 例外処理
          _ => throw UnimplementedError(),
        };
      },
    ),
  ],
);
