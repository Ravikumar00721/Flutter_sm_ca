import 'package:f_sm_ca/clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository{
  Future<UserEntity> login(String email, String password);
}