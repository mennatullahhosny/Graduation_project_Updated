import '../../../response/RegisterResponse.dart';
import '../../data_source/auth_remote_data_source.dart';
import '../../repository/auth_repository_contract.dart';
import '../data_source/auth_remote_data_source_impl.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AuthResultEntity> register(
      String username, String password, String email, String phone) {
    return remoteDataSource.register(username, password, email, phone);
  }
  
  @override
  Future<AuthResultEntity> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
