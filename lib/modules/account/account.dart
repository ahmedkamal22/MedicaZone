// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medica_zone/layout/cubit/home_cubit.dart';
// import 'package:medica_zone/layout/cubit/home_states.dart';
// import 'package:medica_zone/models/login/login_model.dart';
// import 'package:medica_zone/modules/login/cubit/login_state.dart';
// import 'package:medica_zone/shared/components/components.dart';
// import 'package:medica_zone/shared/components/constants.dart';
// import 'package:medica_zone/shared/cubit/app_cubit.dart';
//
// class AccountScreen extends StatelessWidget {
//   var name = TextEditingController();
//   var phone = TextEditingController();
//   var email = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var model = HomeCubit.get(context).userModel;
//         name.text = "${model!.data!.name}";
//         phone.text = "${model.data!.phone}";
//         email.text = "${model.data!.email}";
//         return Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   if (state is ProfileUpdateLoadingState)
//                     LinearProgressIndicator(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   defaultFormField(
//                     keyboard_type: TextInputType.name,
//                     controller_type: name,
//                     label_text: "Name",
//                     Validate: (String? Name) {
//                       if (Name!.isEmpty) {
//                         return "Name mustn't be empty!";
//                       }
//                       return null;
//                     },
//                     prefix_icon: Icons.person,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   defaultFormField(
//                     keyboard_type: TextInputType.emailAddress,
//                     controller_type: email,
//                     label_text: "Email",
//                     Validate: (String? Email) {
//                       if (Email!.isEmpty) {
//                         return "Email mustn't be empty!";
//                       }
//                       return null;
//                     },
//                     prefix_icon: Icons.email,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   defaultFormField(
//                     keyboard_type: TextInputType.phone,
//                     controller_type: phone,
//                     label_text: "Phone",
//                     Validate: (String? Phone) {
//                       if (Phone!.isEmpty) {
//                         return "Phone mustn't be empty!";
//                       }
//                       return null;
//                     },
//                     prefix_icon: Icons.phone,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   defaultButton(
//                       function: () {
//                         if (formKey.currentState!.validate()) {
//                           HomeCubit.get(context).updateUserData(
//                               name: name.text,
//                               email: email.text,
//                               phone: phone.text);
//                           showToast(
//                               message: "Data updated Successfully",
//                               states: ToastStates.SUCESS);
//                         }
//                       },
//                       redius: 60,
//                       isUpper: false,
//                       text: "Update Data"),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // defaultButton(
//                   //     function: () {
//                   //       signOut(context);
//                   //     },
//                   //     redius: 60,
//                   //     isUpper: false,
//                   //     text: "Sign Out")
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
