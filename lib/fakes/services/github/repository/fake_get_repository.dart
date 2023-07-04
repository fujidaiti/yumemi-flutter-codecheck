import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/faker.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/types/repository.dart';

final fakeRepositoryProvider = FutureProvider.autoDispose.family(
  (ref, ({String name, String owner}) params) async {
    await Future.delayed(const Duration(milliseconds: 750));
    return Repository(
      name: params.name,
      owner: params.owner,
      avatarUrl: faker.internet.httpsUrl(),
      description:
          faker.lorem.sentences(faker.randomGenerator.integer(3)).join(" "),
      language: faker.lorem.word(),
      stargazersCount: faker.randomGenerator.integer(2000),
      watchersCount: faker.randomGenerator.integer(2000),
      forksCount: faker.randomGenerator.integer(200),
      openIssuesCount: faker.randomGenerator.integer(200),
    );
  },
);
