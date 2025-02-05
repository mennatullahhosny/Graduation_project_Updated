import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/ui/sign_up_screen/cubit/register_state.dart';
import 'package:graduation_project/ui/sing_in_screen/login_state.dart';

class LoginScreenViewmodel extends Cubit<LoginState> {
  LoginScreenViewmodel({required this.repositoryContract})
      : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  // TextEditingController userNameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? value = false;
  var formKey = GlobalKey<FormState>();
  AuthRepositoryContract repositoryContract;
  void SignUp() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState(loadingMassage: "Loading..."));
        var response = await repositoryContract.login(
          passwordController.text,
          emailController.text,
        );
        if (response.status == 'failure') {
          emit(
            LoginErrorState(errorMessage: response.message),
          );
        } else {
          emit(
            LoginSuccessState(response: response),
          );
        }
      } catch (e) {
        emit(
          LoginErrorState(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
