// import 'package:graduation_project/data/response/RegisterResponse.dart';

import '../../response/RegisterResponse.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResultEntity> register(
      String username, String password, String email, String phone);

  Future<AuthResultEntity> login(
    String username, 
    String password);
}
