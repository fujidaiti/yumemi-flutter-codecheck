import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/common/values/percentage.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/faker.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final fakeRepositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
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
        "C": Percentage(40),
        "Dart": Percentage(20),
        "Swift": Percentage(10),
        "Python": Percentage(20),
        "Shell": Percentage(7.5),
        "List": Percentage(2.5),
      },
    );
  },
);
