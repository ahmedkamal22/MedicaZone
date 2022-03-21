import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/register/cubit/register_state.dart';

import '../../../models/login/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  bool passwordVisible = true;
  IconData suffix = Icons.visibility;

  void changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    suffix = passwordVisible ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangePasswordVisibilityState());
  }

  void userRegister({
    @required String? email,
    @required String? password,
    @required String? name,
    @required String? passwordConfiramation,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "email": email,
        "password": password,
        "name": name,
        "password_confirmation": passwordConfiramation,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterFailureState(error.toString()));
    });
  }
}
