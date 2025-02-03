import 'package:graduation_project/data/response/RegisterResponse.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class LoginLoadingState extends RegisterState {
  String? loadingMassage;
  LoginLoadingState({this.loadingMassage});
}

class LoginSuccessState extends RegisterState {
  AuthResultEntity response;
  LoginSuccessState({required this.response});
}

class LoginErrorState extends RegisterState {
  String? errorMessage;
  LoginErrorState({this.errorMessage});
}
