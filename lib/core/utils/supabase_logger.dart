import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class SupabaseLoggingClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final startTime = DateTime.now();

    log('🚀 [Supabase Request] ${request.method} ${request.url}');
    log('→ Headers: ${request.headers}');

    final response = await _inner.send(request);
    final duration = DateTime.now().difference(startTime).inMilliseconds;

    final bytes = await response.stream.toBytes();
    final responseBody = utf8.decode(bytes);

    // 3. Log Response
    log('✅ [Supabase Response] Status: ${response.statusCode} (${duration}ms)');
    if (responseBody.isNotEmpty) {
      log('← Body: $responseBody');
    }

    // 4. Reconstruct the response stream for Supabase
    return http.StreamedResponse(
      http.ByteStream.fromBytes(bytes),
      response.statusCode,
      contentLength: response.contentLength,
      request: request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }
}