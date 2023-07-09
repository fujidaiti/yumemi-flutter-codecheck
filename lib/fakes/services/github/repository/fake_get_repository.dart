import 'package:github_language_colors/github_language_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/values/percentage.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/faker.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final fakeRepositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
    // 遅延
    await Future.delayed(const Duration(milliseconds: 750));
    return Repository(
      name: params.name,
      owner: params.owner,
      avatarUrl: faker.image.image(width: 32, height: 32, random: true),
      description:
          faker.lorem.sentences(faker.randomGenerator.integer(3)).join(" "),
      stargazersCount: faker.randomGenerator.integer(2000),
      watchersCount: faker.randomGenerator.integer(2000),
      forksCount: faker.randomGenerator.integer(200),
      openIssuesCount: faker.randomGenerator.integer(200),
      openPullRequestsCount: faker.randomGenerator.integer(200),
      languages: {
        for (var i = 0; i < faker.randomGenerator.integer(7); ++i)
          faker.randomGenerator.element(githubLanguageColors.keys.toList()):
              Percentage(faker.randomGenerator.decimal(scale: 30.0, min: 0.1)),
      },
    );
  },
);
