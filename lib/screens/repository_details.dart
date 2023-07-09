import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';
import 'package:yumemi_flutter_codecheck/components/common/avatar_icon.dart';
import 'package:yumemi_flutter_codecheck/components/github/repository_languages_chart.dart';
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

    final pullRequests = _buildStatusTile(
      context: context,
      title: "Pull Requests",
      counter: repository.openPullRequestsCount,
      icon: const Icon(OctIcons.git_pull_request_24),
    );

    final languages = ListTile(
      leading: const Icon(OctIcons.package_24),
      titleAlignment: ListTileTitleAlignment.top,
      title: const Text("Languages"),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: RepositoryLanguagesChart(
          languages: repository.languages,
          legendStyle: const SegmentedBarLegendStyle(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            maxLines: 3,
          ),
          barStyle: const SegmentedBarStyle(
            gap: 2,
            padding: EdgeInsets.all(6),
          ),
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          header,
          if (description != null) description,
          stars,
          forks,
          watchers,
          issues,
          pullRequests,
          languages,
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
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget _buildError(Object error, StackTrace stackTrace) {
    return UnkownErrorWidget(error, stackTrace);
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
