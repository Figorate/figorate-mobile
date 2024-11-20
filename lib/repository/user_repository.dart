import 'package:figorate_mobile/data/models/user_model.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';

class UserRepository {
  
  Future<User> getUser(String userId) async {
    final response = await userApiService.getUser(userId);
    return User.fromJson(response.data);
  }

  Future<User> createUser(User user) async {
    final response = await userApiService.createUser(user);
    return User.fromJson(response.data);
  }

  Future<User> updateUser(String userId, User user) async {
    final response = await userApiService.updateUser(userId, user);
    return User.fromJson(response.data);
  }

  Future<void> deleteUser(String userId) async {
    await userApiService.deleteUser(userId);
  }

  Future<List<User>> listUsers() async {
    final response = await userApiService.listUsers();
    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }
}
