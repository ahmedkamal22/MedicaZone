// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medica_zone/layout/home.dart';
// import 'package:medica_zone/shared/components/components.dart';
// import 'package:medica_zone/shared/components/constants.dart';
// import 'package:medica_zone/shared/network/local/cache_helper.dart';
//
// import '../../shared/cubit/app_cubit.dart';
// import '../splash/splach_screen.dart';
// import 'cubit/register_cubit.dart';
// import 'cubit/register_state.dart';
//
// class Register extends StatelessWidget {
//   var email = TextEditingController();
//   var password = TextEditingController();
//   var phone = TextEditingController();
//   var name = TextEditingController();
//
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => MedicaRegisterCubit(),
//       child: BlocConsumer<MedicaRegisterCubit, MedicaRegisterStates>(
//         listener: (context, state) {
//           if (state is MedicaRegisterSuccessState) {
//             if (state.loginModel.status == true) {
//               CacheHelper.saveData(
//                       key: tokenKeyValue, value: state.loginModel.data!.token)
//                   .then((value) {
//                 token = "${state.loginModel.data!.token}";
//                 navigateAndFinish(context, SplashScreen());
//               });
//             } else {
//               showToast(
//                   message: state.loginModel.message,
//                   states: ToastStates.FAILURE);
//             }
//           }
//         },
//         builder: (context, state) {
//           var cubit = MedicaRegisterCubit.get(context);
//           return Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         defaultFormField(
//                             style: TextStyle(
//                                 color: AppCubit.get(context).isDark
//                                     ? Colors.white
//                                     : Colors.black),
//                             keyboard_type: TextInputType.name,
//                             controller_type: name,
//                             label_text: "Name",
//                             prefix_icon: Icons.person,
//                             Validate: (nameCheck) {
//                               if (nameCheck!.isEmpty) {
//                                 return "Name mustn't be empty";
//                               }
//                               return null;
//                             }),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         defaultFormField(
//                             style: TextStyle(
//                                 color: AppCubit.get(context).isDark
//                                     ? Colors.white
//                                     : Colors.black),
//                             keyboard_type: TextInputType.emailAddress,
//                             controller_type: email,
//                             label_text: "Email",
//                             prefix_icon: Icons.email,
//                             Validate: (emailCheck) {
//                               if (emailCheck!.isEmpty) {
//                                 return "Email mustn't be empty";
//                               }
//                               return null;
//                             }),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         defaultFormField(
//                             style: TextStyle(
//                                 color: AppCubit.get(context).isDark
//                                     ? Colors.white
//                                     : Colors.black),
//                             keyboard_type: TextInputType.phone,
//                             controller_type: phone,
//                             label_text: "Phone",
//                             prefix_icon: Icons.phone,
//                             Validate: (phoneCheck) {
//                               if (phoneCheck!.isEmpty) {
//                                 return "Phone mustn't be empty";
//                               }
//                               return null;
//                             }),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         defaultFormField(
//                           style: TextStyle(
//                               color: AppCubit.get(context).isDark
//                                   ? Colors.white
//                                   : Colors.black),
//                           keyboard_type: TextInputType.visiblePassword,
//                           controller_type: password,
//                           label_text: "Password",
//                           prefix_icon: Icons.lock,
//                           suffix_icon: cubit.suffix,
//                           isVisible: cubit.passwordVisible,
//                           isPasswordVisible: () {
//                             cubit.changePasswordVisibility();
//                           },
//                           onSubmit: (value) {
//                             if (formKey.currentState!.validate()) {
//                               cubit.userRegister(
//                                   email: email.text,
//                                   password: password.text,
//                                   name: name.text,
//                                   phone: phone.text);
//                             }
//                           },
//                           Validate: (passwordCheck) {
//                             if (passwordCheck!.isEmpty) {
//                               return "Password mustn't be empty";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         ConditionalBuilder(
//                           condition: state is! MedicaRegisterLoadingState,
//                           builder: (context) => defaultButton(
//                             text: "register",
//                             redius: 60.0,
//                             function: () {
//                               if (formKey.currentState!.validate()) {
//                                 cubit.userRegister(
//                                     email: email.text,
//                                     password: password.text,
//                                     name: name.text,
//                                     phone: phone.text);
//                               }
//                             },
//                           ),
//                           fallback: (context) =>
//                               Center(child: CircularProgressIndicator()),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
