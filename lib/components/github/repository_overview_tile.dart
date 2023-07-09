import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:github_language_colors/github_language_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';
import 'package:yumemi_flutter_codecheck/components/common/avatar_icon.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';

const _minTileHeight = 140.0;
const _fallbackLanguageColor = Colors.lightGreen;

typedef OnTapRepositoryOverviewTileCallback = void Function(
  RepositoryOverview rpeo,
);

class RepositoryOverviewTile extends StatelessWidget {
  const RepositoryOverviewTile({
    super.key,
    required this.repository,
    this.onTap,
  });

  final AsyncValue<RepositoryOverview> repository;
  final OnTapRepositoryOverviewTileCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final body = repository.when(
      data: (overview) => _build(context, overview),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => _buildError(context, error, stackTrace),
    );

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: switch ((onTap, repository.asData)) {
          (var callback?, var data?) => () => callback(data.value),
          _ => null,
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: _minTileHeight,
          ),
          child: body,
        ),
      ),
    );
  }

  Widget _build(BuildContext context, RepositoryOverview repo) {
    final header = Row(
      children: [
        AvatarIcon(
          url: repo.avatarUrl,
          size: 24,
        ),
        const SizedBox(width: 12),
        Text(
          repo.owner,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

    final name = Text(
      repo.name,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );

    final description = switch (repo.description) {
      String text when text.isNotEmpty => Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      _ => const SizedBox(height: 20),
    };

    final stars = Chip(
      label: Text(NumberFormat.compact().format(repo.stars)),
      avatar: const Icon(OctIcons.star_16),
      visualDensity: VisualDensity.compact,
    );

    final language = switch (repo.language) {
      null => null,
      String name => Chip(
          label: Text(name),
          avatar: Icon(
            Icons.circle,
            color: switch (githubLanguageColors[name]) {
              int hexCode => Color(hexCode),
              null => _fallbackLanguageColor,
            },
          ),
          visualDensity: VisualDensity.compact,
        ),
    };

    final badges = Row(
      children: [
        stars,
        if (language != null) ...[
          const SizedBox(width: 10),
          language,
        ],
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const SizedBox(height: 4),
          name,
          const SizedBox(height: 4),
          description,
          const SizedBox(height: 8),
          badges,
        ],
      ),
    );
  }

  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    return UnkownErrorWidget(
      error,
      stackTrace,
      child: Center(
        child: ListTile(
          leading: Icon(
            OctIcons.alert_24,
            color: Theme.of(context).colorScheme.error,
          ),
          title: const Text("Failed to load..."),
        ),
      ),
    );
  }
}
