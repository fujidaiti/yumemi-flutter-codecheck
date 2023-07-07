import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/faker.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';

final fakeRepositoriesProvider = FutureProvider.autoDispose.family(
  (ref, RepositoriesProviderParams params) async {
    final totalCount = faker.randomGenerator.integer(100);
    final items = List.generate(
      min(totalCount, params.perPage),
      (_) {
        return RepositoryOverview(
          name: faker.lorem.word(),
          description:
              faker.lorem.sentences(faker.randomGenerator.integer(3)).join(" "),
          owner: faker.lorem.word(),
          avatarUrl: faker.image.image(width: 32, height: 32, random: true),
          language: faker.lorem.word(),
          stars: faker.randomGenerator.integer(2000),
        );
      },
    );

    await Future.delayed(const Duration(milliseconds: 750));

    return (totalCount, items);
  },
);
