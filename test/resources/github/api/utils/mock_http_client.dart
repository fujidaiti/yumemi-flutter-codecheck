import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
export 'mock_http_client.mocks.dart';
