import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/components/github/avatar_icon.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/get_repository.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

class RepositoryDetails extends ConsumerWidget {
  const RepositoryDetails({
    super.key,
    required this.name,
    required this.owner,
  });

  final String name;
  final String owner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backButton = IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back),
    );

    final repository =
        ref.watch(repositoryProvider((name: name, owner: owner)));

    return Scaffold(
      appBar: AppBar(
        leading: backButton,
      ),
      body: repository.when(
        data: (repo) => _buildBody(context, repo),
        error: _buildError,
        loading: _buildLoading,
      ),
    );
  }

  Widget _buildBody(BuildContext context, Repository repository) {
    final repoName = Text(
      repository.name,
      style: Theme.of(context).textTheme.titleLarge,
    );

    final avatar = AvatarIcon(url: repository.avatarUrl);

    final header = ListTile(
      leading: avatar,
      title: repoName,
      subtitle: Text("${repository.owner}/"),
    );

    final description = switch (repository.description) {
      null => null,
      final text => Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
    };

    final stars = _buildStatusTile(
      context: context,
      title: "Stars",
      counter: repository.stargazersCount,
      icon: const Icon(OctIcons.star_fill_24),
    );

    final forks = _buildStatusTile(
      context: context,
      title: "Forks",
      counter: repository.forksCount,
      icon: const Icon(OctIcons.repo_forked_24),
    );

    final watchers = _buildStatusTile(
      context: context,
      title: "Watchers",
      counter: repository.watchersCount,
      icon: const Icon(OctIcons.eye_24),
    );

    final issues = _buildStatusTile(
      context: context,
      title: "Issues",
      counter: repository.openIssuesCount,
      icon: const Icon(OctIcons.issue_opened_24),
    );

    final language = switch (repository.language) {
      null => null,
      final lang => ListTile(
          leading: const Icon(OctIcons.code_24),
          title: Text(lang),
        ),
    };

    return SingleChildScrollView(
      child: Column(
        children: [
          header,
          if (description != null) description,
          stars,
          forks,
          watchers,
          issues,
          if (language != null) language,
        ],
      ),
    );
  }

  Widget _buildStatusTile({
    required BuildContext context,
    required String title,
    required int counter,
    required Icon icon,
  }) {
    return ListTile(
      title: Text(title),
      leading: icon,
      trailing: Text(
        "$counter",
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  // TODO; エラー処理
  Widget _buildError(Object error, StackTrace stackTrace) {
    return Center(
      child: Text("$error"),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
