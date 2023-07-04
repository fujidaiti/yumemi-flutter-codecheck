import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/repository/fake_get_repository.dart';
import 'package:yumemi_flutter_codecheck/fakes/services/github/search/fake_search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/repository/get_repository.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';

final fakeProviders = <Override>[
  repositoryProvider.overrideWithProvider(fakeRepositoryProvider),
  repositoriesProvider.overrideWithProvider(fakeRepositoriesProvider),
];
