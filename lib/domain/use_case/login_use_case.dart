import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/response/RegisterResponse.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});

  Future<AuthResultEntity> invoke(
      String password, String email) {
    return repositoryContract.login(password, email);
  }
}