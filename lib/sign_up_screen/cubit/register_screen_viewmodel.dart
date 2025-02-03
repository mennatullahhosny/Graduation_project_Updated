import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/sign_up_screen/cubit/register_state.dart';

class RegisterScreenViewmodel extends Cubit<RegisterState> {
  RegisterScreenViewmodel({required this.repositoryContract})
      : super(RegisterInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? value = false;
  var formKey = GlobalKey<FormState>();
  AuthRepositoryContract repositoryContract;
  void SignUp() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState(loadingMassage: "Loading..."));
        var response = await repositoryContract.register(
            userNameController.text,
            passwordController.text,
            emailController.text,
            phoneController.text);
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
