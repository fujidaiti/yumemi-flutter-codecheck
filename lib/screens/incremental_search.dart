import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/errors/types/request_aborted_exception.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';
import 'package:yumemi_flutter_codecheck/components/common/search_box.dart';
import 'package:yumemi_flutter_codecheck/config/colors.dart';
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
        context.pop(query.value);
      }
    }

    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = colorScheme.surfaceVariant;

    final divider = PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Divider(
        height: 1,
        color: colorScheme.divider,
      ),
    );

    final searchBar = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      title: SearchBox(
        initialText: query.value.keywords,
        hintText: "Search repositories",
        onSubmitted: onKeywordsSubmitted,
        onTextChanged: onKeywordsChanged,
        autoFocus: true,
      ),
      bottom: divider,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: searchBar,
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder(
          valueListenable: query,
          builder: (context, query, _) {
            if (query.keywords.isEmpty) {
              // なにも表示しない
              return const SizedBox.shrink();
            } else {
              return _SearchResultList(query);
            }
          },
        ),
      ),
    );
  }

  static Future<SearchQuery?> showAsDialog({
    required BuildContext context,
    required SearchQuery initialQuery,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return IncrementalSearch(
            initialQuery: initialQuery,
          );
        },
      ),
    );
  }
}

final _topHitItemsProvider = FutureProvider.autoDispose.family(
  (ref, SearchQuery query) async {
    // 最初の`maxItemCount`件だけ取得する
    const maxItemCount = 6;
    // 認証していないとすぐにレート制限に引っかかるので少し長めに取る
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
    return ref.watch(_topHitItemsProvider(query)).when(
          data: (items) => _build(context, items),
          error: UnkownErrorWidget.new,
          loading: _buildLoading,
        );
  }

  Widget _build(BuildContext context, List<RepositoryOverview> items) {
    void onTapSeeAllButton() {
      context.push("/search", extra: query);
    }

    final textTheme = Theme.of(context).textTheme;

    final header = Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
      child: Row(
        children: [
          Text(
            "Top hits",
            style: textTheme.labelLarge,
          ),
          const Spacer(),
          TextButton(
            onPressed: onTapSeeAllButton,
            child: const Text("See all"),
          ),
        ],
      ),
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: header),
        SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _SearchResultItem(items[index]);
          },
        ),
      ],
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
