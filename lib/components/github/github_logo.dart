import 'package:flutter/material.dart';

const _assetDarkLogo = "assets/github/github-logo-dark.png";
const _assetLightLogo = "assets/github/github-logo-light.png";

class GitHubLogo extends StatelessWidget {
  const GitHubLogo({
    super.key,
    required this.height,
  }) : assert(height > 0);

  final double height;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Image(
      image: switch (brightness) {
        Brightness.light => const AssetImage(_assetLightLogo),
        Brightness.dark => const AssetImage(_assetDarkLogo),
      },
      height: height,
      fit: BoxFit.fitHeight,
    );
  }
}
