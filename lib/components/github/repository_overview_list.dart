import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_overview_tile.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/search_query.dart';

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
  final Widget Function(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) errorBuilder;

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
        final _ItemTileInfo info =
            (index: index, query: query, onTap: onTapItem);
        // _ListItemTile`をconstにするために、プロバイダー経由でパラメータを渡すようにする
        // [参考 : riverpodのサンプルコード]
        // https://github.com/rrousselGit/riverpod/blob/da4909ce73cb5420e48475113f365fc0a3368390/examples/marvel/lib/src/screens/home.dart#L134-L141
        return ProviderScope(
          overrides: [_itemTileInfoProvider.overrideWithValue(info)],
          child: const _ListItemTile(),
        );
      },
    );
  }
}

typedef _ItemTileInfo = ({
  int index,
  SearchQuery query,
  OnTapRepositoryOverviewTileCallback? onTap,
});

// このプロバイダーを経由して`_ListItemTile`パラメータを渡すので、
// `_ListItemTile`を使うときは必ず`ProviderScope`でこのプロバイダーの値を上書きする
final _itemTileInfoProvider =
    Provider<_ItemTileInfo>((ref) => throw UnimplementedError());

class _ListItemTile extends ConsumerWidget {
  const _ListItemTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(_itemTileInfoProvider);
    final item = ref.watch(_itemAtIndexProvider((
      index: info.index,
      query: info.query,
    )));
    return RepositoryOverviewTile(
      overview: item,
      onTap: info.onTap,
    );
  }
}

// 検索結果１ページ当たりの最大アイテム数
const _pageSizeLimit = 30;

typedef _Pagination = ({
  SearchQuery query,
  int page,
});

final _paginatedSearchResultProvider = Provider.autoDispose.family(
  (ref, _Pagination pagination) {
    return ref.watch(
      repositoriesProvider(
        (
          query: pagination.query,
          page: pagination.page,
          perPage: _pageSizeLimit,
        ),
      ),
    );
  },
);

final _totalItemCountProvider = Provider.autoDispose.family(
  (ref, SearchQuery query) {
    final _Pagination firstPage = (page: 0, query: query);
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
      page: params.index ~/ _pageSizeLimit,
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
