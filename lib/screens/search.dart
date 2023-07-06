import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_overview_list.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

class Search extends HookWidget {
  const Search({
    super.key,
    required this.query,
  });

  final SearchQuery query;

  @override
  Widget build(BuildContext context) {
    final query = useState(this.query);

    void onNewKeywordsSubmitted(String keywords) {
      query.value = SearchQuery(
        keywords: keywords.trim(),
      );
    }

    void onTapItem(RepositoryOverview repo) {
      context.push("/repository/${repo.owner}/${repo.name}");
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBox(
          initialText: query.value.keywords,
          onSubmitted: onNewKeywordsSubmitted,
        ),
      ),
      body: RepositoryOverviewList(
        query: query.value,
        onTapItem: onTapItem,
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (context, error, stackTrace) {
          return UnkownErrorWidget(error, stackTrace);
        },
      ),
    );
  }
}
