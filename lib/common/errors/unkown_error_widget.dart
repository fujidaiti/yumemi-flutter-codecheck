import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/common/errors/handlers.dart';

class UnkownErrorWidget extends StatelessWidget {
  factory UnkownErrorWidget(Object error, StackTrace? stackTrace) {
    if (kReleaseMode) {
      consumeError(error, stackTrace);
    } else {
      handleError(error, stackTrace);
    }
    return UnkownErrorWidget._(error);
  }

  const UnkownErrorWidget._(this.error);

  final Object error;

  @override
  Widget build(BuildContext context) {
    return switch (kDebugMode) {
      true => ErrorWidget(error),
      false => _buildPrettyErrorView(context),
    };
  }

  Widget _buildPrettyErrorView(BuildContext context) {
    void backToPrevious() {
      Navigator.of(context).maybePop();
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oups, something went wrong!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: backToPrevious,
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
