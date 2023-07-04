import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/fakes/fakes.dart';
import 'package:yumemi_flutter_codecheck/router.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: fakeProviders,
      child: const _App(),
    ),
  );
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
