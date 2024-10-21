import 'package:dio/dio.dart';
import 'package:figorate_mobile/core/network/api_endpoints.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    // Initialize Dio with options
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl, // Use the base URL from your endpoints file
      connectTimeout: const Duration(seconds: 5),  // 5 seconds
      receiveTimeout: const Duration(seconds: 3),  // 3 seconds
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    _dio = Dio(options);
  }

  // GET request
  Future<Response?> getUser() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getUser);
      return response;
    } on DioException catch (e) {
      print('GET user request error: $e');
      return null;
    }
  }

  Future<Response?> getPosts() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getPosts);
      return response;
    } on DioException catch (e) {
      print('GET posts request error: $e');
      return null;
    }
  }

  Future<Response?> createPost(Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(ApiEndpoints.createPost, data: data);
      return response;
    } on DioException catch (e) {
      print('POST create request error: $e');
      return null;
    }
  }

  Future<Response?> updatePost(String postId, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.put('${ApiEndpoints.updatePost}/$postId', data: data);
      return response;
    } on DioException catch (e) {
      print('PUT update request error: $e');
      return null;
    }
  }

  Future<Response?> deletePost(String postId) async {
    try {
      Response response = await _dio.delete('${ApiEndpoints.deletePost}/$postId');
      return response;
    } on DioException catch (e) {
      print('DELETE request error: $e');
      return null;
    }
  }
}
