// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class MedicaRegisterCubit extends Cubit<MedicaRegisterStates> {
//   MedicaRegisterCubit() : super(MedicaRegisterInitialState());
//
//   static MedicaRegisterCubit get(context) => BlocProvider.of(context);
//   late LoginModel loginModel;
//   bool passwordVisible = true;
//   IconData suffix = Icons.visibility;
//
//   void changePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     suffix = passwordVisible ? Icons.visibility : Icons.visibility_off;
//     emit(MedicaRegisterChangePasswordVisibilityState());
//   }
//
//   void userRegister({
//     @required String? email,
//     @required String? password,
//     @required String? name,
//     @required String? phone,
//   }) {
//     emit(MedicaRegisterLoadingState());
//     DioHelper.postData(
//       url: REGISTER,
//       data: {
//         "email": email,
//         "password": password,
//         "name": name,
//         "phone": phone,
//       },
//     ).then((value) {
//       print(value.data);
//       loginModel = LoginModel.fromJson(value.data);
//       emit(MedicaRegisterSuccessState(loginModel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(MedicaRegisterFailureState(error.toString()));
//     });
//   }
// }
