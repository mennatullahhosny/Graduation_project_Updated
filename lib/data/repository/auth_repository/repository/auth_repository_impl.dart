import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/repository/auth_repository/data_source/auth_remote_data_source_impl.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:graduation_project/data/model/response/RegisterResponse.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AuthResultEntity> register(
      String username, String password, String email, String phone) {
    return remoteDataSource.register(username, password, email, phone);
  }

  @override
  Future<AuthResultEntity> login(String password, String email) {
    return remoteDataSource.login(password, email);
  }
}
