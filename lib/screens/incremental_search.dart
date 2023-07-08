import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/errors/types/request_aborted_exception.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

class IncrementalSearch extends HookWidget {
  const IncrementalSearch({
    super.key,
    required this.initialQuery,
  });

  final SearchQuery initialQuery;

  @override
  Widget build(BuildContext context) {
    final query = useValueNotifier(initialQuery);

    void onKeywordsChanged(String keywords) {
      query.value = SearchQuery(keywords: keywords.trim());
    }

    void onKeywordsSubmitted(String _) {
      if (query.value.keywords.isNotEmpty) {
        context
            .push("/search", extra: query.value)
            // 検索画面と一緒にこの画面もpopする
            .then((_) => Navigator.of(context).pop());
      }
    }

    final searchBar = SearchBox(
      initialText: query.value.keywords,
      hintText: "Search repositories",
      onSubmitted: onKeywordsSubmitted,
      onTextChanged: onKeywordsChanged,
      autoFocus: true,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: searchBar,
      ),
      body: ValueListenableBuilder(
        valueListenable: query,
        builder: (context, query, _) {
          return _SearchResultList(query);
        },
      ),
    );
  }

  static void showAsDialog(BuildContext context, SearchQuery query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return IncrementalSearch(
            initialQuery: query,
          );
        },
      ),
    );
  }
}

final _incrementalSearchResult = FutureProvider.autoDispose.family(
  (ref, SearchQuery query) async {
    // 最初の`maxItemCount`件だけ取得する
    const maxItemCount = 6;
    const debounceDuration = Duration(milliseconds: 500);

    if (query.keywords.isEmpty) {
      return const <RepositoryOverview>[];
    }

    bool isCanceled = false;
    ref.onDispose(() => isCanceled = true);
    await Future.delayed(debounceDuration);
    if (isCanceled) {
      throw const RequestAbortedException("_incrementalSearchResult");
    }

    final params = (page: 1, perPage: maxItemCount, query: query);
    final (_, items) = await ref.watch(repositoriesProvider(params).future);
    return items;
  },
);

class _SearchResultList extends ConsumerWidget {
  const _SearchResultList(this.query);

  final SearchQuery query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(_incrementalSearchResult(query)).when(
          data: _build,
          error: UnkownErrorWidget.new,
          loading: _buildLoading,
        );
  }

  Widget _build(List<RepositoryOverview> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _SearchResultItem(items[index]);
      },
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem(this.repo);

  final RepositoryOverview repo;

  @override
  Widget build(BuildContext context) {
    void onTapItem() {
      context.push("/repository/${repo.owner}/${repo.name}");
    }

    return ListTile(
      onTap: onTapItem,
      leading: const Icon(OctIcons.repo_24),
      title: Text(
        "${repo.owner}/${repo.name}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(OctIcons.arrow_up_right_16),
    );
  }
}
