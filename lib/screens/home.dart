import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/components/github/github_logo.dart';
import 'package:yumemi_flutter_codecheck/screens/incremental_search.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapSearchBar() async {
      final query = await IncrementalSearch.showAsDialog(
        context: context,
        initialQuery: const SearchQuery(keywords: ""),
      );
      if (query != null && context.mounted) {
        context.pushNamed(
          "search",
          queryParameters: {
            "q": query.keywords,
          },
        );
      }
    }

    final searchBar = SearchBox(
      autoFocus: false,
      readOnly: true,
      onTap: onTapSearchBar,
      hintText: "Search repositories",
    );

    final gitHubLogo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powerd by",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(width: 4),
        const GitHubLogo(height: 32),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 40,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.center,
                child: searchBar,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: gitHubLogo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
