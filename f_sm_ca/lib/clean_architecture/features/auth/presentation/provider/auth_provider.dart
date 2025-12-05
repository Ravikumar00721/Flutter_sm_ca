import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repo/auth_repo_imple.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecases.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, AsyncValue<UserEntity?>>((ref) {
  final remote = AuthRemoteDataSource();
  final repo = AuthRepositoryImpl(remote);
  final usecase = LoginUseCase(repo);
  return AuthNotifier(usecase);
});

class AuthNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final user = await loginUseCase(email, password);
    state = AsyncValue.data(user);
  }
}
