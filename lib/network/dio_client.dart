import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_exception.dart';

class DioClient {
  final Dio _dio;

  DioClient({required String baseUrl, Map<String, dynamic>? defaultHeaders})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: defaultHeaders ?? {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("Sending request to: ${options.uri}");
        handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint("Response received: ${response.statusCode}");
        handler.next(response);
      },
      onError: (DioException error, handler) {
        debugPrint("Error occurred: ${error.message}");
        handler.next(error);
      },
    ));
  }

  Future<Response> _requestHandler(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _requestHandler(() => _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    ));
  }

  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _requestHandler(() => _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    ));
  }

  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _requestHandler(() => _dio.put(
      endpoint,
      data: data,
      options: Options(headers: headers),
    ));
  }

  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _requestHandler(() => _dio.delete(
      endpoint,
      data: data,
      options: Options(headers: headers),
    ));
  }

  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _requestHandler(() => _dio.patch(
      endpoint,
      data: data,
      options: Options(headers: headers),
    ));
  }
}
