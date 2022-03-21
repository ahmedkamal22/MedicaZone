import '../../../models/login/login_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  LoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterFailureState extends RegisterStates {
  final String error;

  RegisterFailureState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
