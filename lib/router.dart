import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/screens/home.dart';
import 'package:yumemi_flutter_codecheck/screens/not_found.dart';
import 'package:yumemi_flutter_codecheck/screens/repository_details.dart';
import 'package:yumemi_flutter_codecheck/screens/search.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

final router = GoRouter(
  initialLocation: "/",
  errorBuilder: (context, state) {
    return const NotFound();
  },
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: "/search",
      name: "search",
      builder: (context, state) {
        return switch (state.queryParameters) {
          {"q": String keywords} => Search(
              query: SearchQuery(keywords: keywords),
            ),
          _ => const NotFound(),
        };
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
