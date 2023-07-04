import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';

typedef OnTapRepositoryOverviewTileCallback = void Function(
    RepositoryOverview rpeo);

class RepositoryOverviewTile extends StatelessWidget {
  const RepositoryOverviewTile({
    super.key,
    required this.overview,
    this.onTap,
  });

  final AsyncValue<RepositoryOverview> overview;
  final OnTapRepositoryOverviewTileCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final body = overview.when(
      data: (overview) => _build(context, overview),
      loading: () => const Center(child: CircularProgressIndicator()),
      // TODO; エラー処理
      error: (error, _) => Text("$error"),
    );

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: switch ((onTap, overview.asData)) {
          (var callback?, var data?) => () => callback(data.value),
          _ => null,
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: body,
        ),
      ),
    );
  }

  Widget _build(BuildContext context, RepositoryOverview overview) {
    return Column(
      children: [
        Text(
          overview.owner,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          overview.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (overview.description != null)
          Text(
            overview.description!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
      ],
    );
  }
}
