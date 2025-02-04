// import 'package:graduation_project/data/repository/auth_repository/repository/auth_repository_impl.dart';
// import 'package:graduation_project/data/response/RegisterResponse.dart';
// import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';

// class RegisterUseCase {
//   AuthRepositoryContract repositoryContract ;
//   RegisterUseCase({required this.repositoryContract});

//   Future<AuthResultEntity>invoke(String username, String password, String email, String phone){
//     return repositoryContract.register(username, password, email, phone);
//   }
// }

// class RegisterResponse {
// }
// RegisterUseCase injectRegisterUseCase(){
//   return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
// }
