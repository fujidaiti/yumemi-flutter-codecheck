import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/screens/home.dart';
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
        assert(
          state.extra is SearchQuery,
          "'/search'はディープリンクに未対応",
        );
        return Search(query: state.extra as SearchQuery);
      },
    ),
  ],
);
