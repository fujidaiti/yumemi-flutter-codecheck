import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Page Not Found",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => context.go("/"),
              child: const Text("Go back home"),
            ),
          ],
        ),
      ),
    );
  }
}
