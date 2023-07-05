import 'dart:convert';

import 'package:http/http.dart' as http;

const _mediaTyle = "application/vnd.github+json";
const _domain = "api.github.com";

class GitHubApiClient extends http.BaseClient {
  final _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll({'accept': _mediaTyle});
    return _client.send(request);
  }

  // TODO; エラー処理（APIのレート制限に引っかかった時など）
  Future<Map<String, dynamic>> getJson({
    required String endpoint,
    Map<String, String>? queryParameters,
  }) async {
    final url = Uri.https(_domain, endpoint, queryParameters);
    final response = await get(url);
    return jsonDecode(response.body);
  }
}
