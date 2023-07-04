import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SearchBox(
          onSubmitted: (text) {
            final trimmed = text.trim();
            if (trimmed.isNotEmpty) {
              final query = SearchQuery(keywords: trimmed);
              context.push("/search", extra: query);
            }
          },
        ),
      ),
    );
  }
}
