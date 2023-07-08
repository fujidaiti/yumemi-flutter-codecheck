import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
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
        context.push("/search", extra: query);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SearchBox(
          autoFocus: false,
          readOnly: true,
          onTap: onTapSearchBar,
          hintText: "Search repositories",
        ),
      ),
    );
  }
}
