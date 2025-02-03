// ignore_for_file: unused_local_variable

import '../../../api/api_manager.dart';
import '../../../response/RegisterResponse.dart';
import '../../data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<AuthResultEntity> register(
      String username, String password, String email, String phone) async {
    var response = await apiManager.register(username, password, email, phone);
    return response;
  }

  @override
  Future<AuthResultEntity> login(String email, String password) async {
    // TODO: implement login
    var  either = await apiManager.login(password, email);
    throw UnimplementedError();
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
