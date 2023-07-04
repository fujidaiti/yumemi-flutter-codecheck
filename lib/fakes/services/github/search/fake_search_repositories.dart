
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/search_repositories.dart';
import 'package:yumemi_flutter_codecheck/services/github/search/types/repository_overview.dart';

final fakeRepositoriesProvider = FutureProvider.autoDispose.family(
  (ref, RepositoriesProviderParams params) async {
    return (0, <RepositoryOverview>[]);
  },
);