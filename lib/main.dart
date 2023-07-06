import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/config/env.dart' as env;
import 'package:yumemi_flutter_codecheck/config/error.dart';
import 'package:yumemi_flutter_codecheck/config/logging/logging.dart';
import 'package:yumemi_flutter_codecheck/fakes/fakes.dart';
import 'package:yumemi_flutter_codecheck/router.dart';

void main() {
  initializeLogger();
  initializeErrorHandlers();

  switch (env.dataType) {
    case env.DataType.real:
      runApp(const ProviderScope(child: _App()));

    case env.DataType.fake:
      runApp(
        ProviderScope(
          overrides: fakeProviders,
          child: const _App(),
        ),
      );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
