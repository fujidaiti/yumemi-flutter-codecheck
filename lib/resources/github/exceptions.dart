import 'dart:convert';

class UnexpectedJsonResponseException implements Exception {
  const UnexpectedJsonResponseException({
    required this.json,
  });

  final Map<String, dynamic> json;

  @override
  String toString() {
    final json = JsonEncoder.withIndent(" " * 2).convert(this.json);
    return "無効な形式のJsonデータを受け取りました\n$json";
  }
}
