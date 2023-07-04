import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_overview_list.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.query,
  });

  final SearchQuery query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SearchBox(),
      ),
      body: RepositoryOverviewList(
        query: query,
        onTapItem: (repo) {
          context.push("/repository/${repo.owner}/${repo.name}");
        },
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (context, error, stackTrace) {
          // TODO; エラー画面
          debugPrint("$error");
          throw UnimplementedError("検索画面でのエラー表示");
        },
      ),
    );
  }
}
