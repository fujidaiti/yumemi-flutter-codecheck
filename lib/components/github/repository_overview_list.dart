import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/errors/types/request_aborted_exception.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_overview_tile.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

typedef ErrorWidgetBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace stackTrace,
);

class RepositoryOverviewList extends ConsumerWidget {
  const RepositoryOverviewList({
    super.key,
    required this.query,
    required this.loadingBuilder,
    required this.errorBuilder,
    this.onTapItem,
  });

  final SearchQuery query;
  final WidgetBuilder loadingBuilder;
  final ErrorWidgetBuilder errorBuilder;
  final OnTapRepositoryOverviewTileCallback? onTapItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(_totalItemCountProvider(query)).when(
          data: (totalItemCount) => _build(context, ref, totalItemCount),
          loading: () => loadingBuilder(context),
          error: (error, stackTrace) =>
              errorBuilder(context, error, stackTrace),
        );
  }

  Widget _build(BuildContext context, WidgetRef ref, int totalItemCount) {
    return ListView.builder(
      itemCount: totalItemCount,
      itemBuilder: (context, index) {
        return _ListItemTile(
          index: index,
          query: query,
          onTap: onTapItem,
        );
      },
    );
  }
}

class _ListItemTile extends ConsumerWidget {
  const _ListItemTile({
    required this.index,
    required this.query,
    required this.onTap,
  });

  final int index;
  final SearchQuery query;
  final OnTapRepositoryOverviewTileCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(
      _itemAtIndexProvider((index: index, query: query)),
    );
    return RepositoryOverviewTile(overview: item, onTap: onTap);
  }
}

// 検索結果１ページ当たりの最大アイテム数
// TODO; 読み込みページサイズを調整
const _pageSizeLimit = 30;

// 参考 : riverpodを使ったページネーション
// https://github.com/rrousselGit/riverpod/blob/da4909ce73cb5420e48475113f365fc0a3368390/examples/marvel/lib/src/screens/home.dart#L17
typedef _Pagination = ({
  SearchQuery query,
  int page,
});

final _paginatedSearchResultProvider = FutureProvider.autoDispose.family(
  (ref, _Pagination pagination) async {
    // TODO; デバウンスタイムを調整
    const debounceDuration = Duration(milliseconds: 250);

    // 読み飛ばされたページを読み込まないようにするためのデバウンス処理（例えばものすごい速さでスクロールした場合）
    // 参考 : https://github.com/rrousselGit/riverpod/blob/da4909ce73cb5420e48475113f365fc0a3368390/examples/marvel/lib/src/screens/home.dart#L29-L33
    bool isCancelled = false;
    ref.onDispose(() => isCancelled = true);
    await Future.delayed(debounceDuration);

    if (isCancelled) {
      throw const RequestAbortedException(
        "_paginatedSearchResultProvider",
      );
    }

    return await ref.watch(
      repositoriesProvider(
        (
          query: pagination.query,
          page: pagination.page,
          perPage: _pageSizeLimit,
        ),
      ).future,
    );
  },
);

final _totalItemCountProvider = Provider.autoDispose.family(
  (ref, SearchQuery query) {
    final _Pagination firstPage = (page: 1, query: query);
    return ref.watch(_paginatedSearchResultProvider(firstPage)).whenData(
      (result) {
        final (totalCount, _) = result;
        return totalCount;
      },
    );
  },
);

final _itemAtIndexProvider = Provider.autoDispose.family(
  (ref, ({int index, SearchQuery query}) params) {
    final _Pagination page = (
      page: params.index ~/ _pageSizeLimit + 1,
      query: params.query,
    );
    return ref.watch(_paginatedSearchResultProvider(page)).whenData(
      (value) {
        final (_, items) = value;
        final localIndex = params.index % _pageSizeLimit;
        return items[localIndex];
      },
    );
  },
);
