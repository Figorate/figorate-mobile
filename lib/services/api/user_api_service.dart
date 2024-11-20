import 'package:dio/dio.dart';
import 'package:figorate_mobile/data/models/user_model.dart';
import 'package:figorate_mobile/network/api_endpoints.dart';
import 'package:figorate_mobile/network/api_exception.dart';
import 'package:figorate_mobile/network/dio_client.dart';

class UserApiService {
  final DioClient _dioClient;

  UserApiService({required DioClient dioClient}) : _dioClient = dioClient;

  Future<Response> _requestHandler(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw ApiException("Unexpected error: $e");
    }
  }

  Future<Response> createUser(User user) async {
    return await _requestHandler(() => _dioClient.post(
      ApiEndpoints.createUser,
      data: user.toJson(),
    ));
  }

  Future<Response> getUser(String userId) async {
    return await _requestHandler(() => _dioClient.get("${ApiEndpoints.getUser}/$userId"));
  }

  Future<Response> updateUser(String userId, User user) async {
    return await _requestHandler(() => _dioClient.put(
      "${ApiEndpoints.updateUser}/$userId",
      data: user.toJson(),
    ));
  }

  Future<Response> deleteUser(String userId) async {
    return await _requestHandler(() => _dioClient.delete("${ApiEndpoints.deleteUser}/$userId"));
  }

  Future<Response> listUsers() async {
    return await _requestHandler(() => _dioClient.get(ApiEndpoints.listUsers));
  }
}
