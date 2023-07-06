import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/common/errors/handlers.dart';

class UnkownErrorWidget extends StatelessWidget {
  /// [child]が`null`でない場合、[build]メソッドは[child]をそのまま返す。
  factory UnkownErrorWidget(
    Object error,
    StackTrace? stackTrace, {
    Widget? child,
  }) {
    if (kReleaseMode) {
      consumeError(error, stackTrace);
    } else {
      handleError(error, stackTrace);
    }
    return UnkownErrorWidget._(error, child);
  }

  const UnkownErrorWidget._(
    this.error, [
    this.child,
  ]);

  final Object error;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child!;
    }

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
