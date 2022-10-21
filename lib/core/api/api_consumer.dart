abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameter});
  Future<dynamic> post(String path,
      {Map<String, dynamic>? queryParameter, Map<String, dynamic>? body});
  Future<dynamic> put(String path,
      {Map<String, dynamic>? queryParameter, Map<String, dynamic>? body});
}
