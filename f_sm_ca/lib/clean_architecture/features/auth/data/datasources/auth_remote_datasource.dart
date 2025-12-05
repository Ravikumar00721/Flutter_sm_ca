import '../models/user_model.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // simulate API

    // Mock API response
    return UserModel(id: 1, name: "Ravi");
  }
}
