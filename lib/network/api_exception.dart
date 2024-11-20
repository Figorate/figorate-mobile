import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  factory ApiException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Connection Timeout: Unable to connect to the server. Please check your internet connection.");

      case DioExceptionType.sendTimeout:
        return ApiException("Send Timeout: Request took too long to send. Please try again.");

      case DioExceptionType.receiveTimeout:
        return ApiException("Receive Timeout: Server took too long to respond. Please try again later.");

      case DioExceptionType.badResponse:
        return ApiException(_handleHttpResponseError(dioError));

      case DioExceptionType.badCertificate:
        return ApiException("Bad Certificate: SSL certificate validation failed. Ensure the server's SSL certificate is valid.");

      case DioExceptionType.connectionError:
        return ApiException("Connection Error: Failed to connect to the server. Check your internet connection or try again later.");

      case DioExceptionType.cancel:
        return ApiException("Request Cancelled: The request to the API server was cancelled.");

      case DioExceptionType.unknown:
        return ApiException("Unknown Error: An unexpected error occurred. Please try again.");
      
      default:
        return ApiException("An unexpected error occurred. Please try again.");
    }
  }

  static String _handleHttpResponseError(DioException dioError) {
    final statusCode = dioError.response?.statusCode;
    final statusMessage = dioError.response?.statusMessage ?? "Unknown error";

    switch (statusCode) {
      case 400:
        return "Bad Request: The server could not understand the request due to invalid syntax.";
      case 401:
        return "Unauthorized: Access is denied due to invalid credentials.";
      case 403:
        return "Forbidden: You do not have permission to access this resource.";
      case 404:
        return "Not Found: The requested resource could not be found on the server.";
      case 500:
        return "Internal Server Error: The server encountered an error. Please try again later.";
      case 503:
        return "Service Unavailable: The server is currently unable to handle the request. Please try again later.";
      default:
        return "HTTP Error: $statusCode $statusMessage";
    }
  }

  @override
  String toString() => message;
}
