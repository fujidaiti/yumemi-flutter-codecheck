import 'package:flutter/material.dart';

class RepositoryDetails extends StatelessWidget {
  const RepositoryDetails({
    super.key,
    required this.name,
    required this.owner,
  });

  final String name;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$owner/$name"),
      ),
    );
  }
}
