import 'package:figorate_mobile/data/models/user_model.dart';
import 'package:figorate_mobile/services/api/user_api_service.dart';

class UserRepository {
  final UserApiService _apiService;

  UserRepository(this._apiService);

  Future<User> getUser(String userId) async {
    final response = await _apiService.getUser(userId);
    return User.fromJson(response.data);
  }

  Future<User> createUser(User user) async {
    final response = await _apiService.createUser(user);
    return User.fromJson(response.data);
  }

  Future<User> updateUser(String userId, User user) async {
    final response = await _apiService.updateUser(userId, user);
    return User.fromJson(response.data);
  }

  Future<void> deleteUser(String userId) async {
    await _apiService.deleteUser(userId);
  }

  Future<List<User>> listUsers() async {
    final response = await _apiService.listUsers();
    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }
}
