import 'dart:convert';

import 'package:http/http.dart' as http;

const _mediaTyle = "application/vnd.github+json";
const _domain = "api.github.com";
const _header = {"accept": _mediaTyle};

class GitHubApiClient {
  GitHubApiClient([
    http.Client? client,
  ]) : _inner = client ?? http.Client();

  final http.Client _inner;

  Future<Map<String, dynamic>> getJson({
    required String endpoint,
    Map<String, String>? queryParameters,
  }) async {
    final url = Uri.https(_domain, endpoint, queryParameters);
    final response = await _inner.get(url, headers: _header);
    return jsonDecode(response.body);
  }
}
