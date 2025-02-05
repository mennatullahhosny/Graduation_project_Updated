import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:graduation_project/data/model/response/RegisterResponse.dart';

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
    var either = await apiManager.login(password, email);
    throw UnimplementedError();
  }

  @override
  Future<AuthResultEntity> verifyCode(String email, String verifyCode) async {
    var response = await apiManager.verifyCode(
        email, verifyCode); // ✅ تأكد أن لديك هذه الدالة في apiManager
    return response;
  }
}
