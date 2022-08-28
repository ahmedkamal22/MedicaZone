import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/login/login.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  var passwordConfirmation = TextEditingController();
  var name = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.loginModel.status == true) {
            CacheHelper.saveData(
                    key: tokenKeyValue,
                    value: 'Bearer ' + state.loginModel.accessToken!)
                .then((value) {
              token = "${'Bearer ' + state.loginModel.accessToken!}";
              // showToast(
              //     message: state.loginModel.message,
              //     states: ToastStates.SUCCESS);
              // HomeCubit.get(context).getFavData();
              // HomeCubit.get(context).getUserData();
              navigateAndFinish(context, LoginScreen());
            });
          } else {
            showToast(
                message: state.loginModel.message, states: ToastStates.FAILURE);
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Medica Zone"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultFormField(
                        controller: name,
                        keyboardType: TextInputType.name,
                        label: "Name",
                        prefix: Icons.person,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Name mustn't be empty!!";
                          }
                          return null;
                        },
                        radius: 20.0,
                        generalWidgetsColor: AppCubit.get(context).isDark
                            ? Colors.grey[200]
                            : Colors.black.withOpacity(.7),
                        style: TextStyle(
                          color: AppCubit.get(context).isDark
                              ? Colors.grey[200]
                              : Colors.black.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Email Address mustn't be empty!!";
                          }
                          return null;
                        },
                        radius: 20.0,
                        generalWidgetsColor: AppCubit.get(context).isDark
                            ? Colors.grey[200]
                            : Colors.black.withOpacity(.7),
                        style: TextStyle(
                          color: AppCubit.get(context).isDark
                              ? Colors.grey[200]
                              : Colors.black.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: cubit.passwordVisible,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        label: "Password",
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Password mustn't be empty!!";
                          }
                          return null;
                        },
                        radius: 20.0,
                        generalWidgetsColor: AppCubit.get(context).isDark
                            ? Colors.grey[200]
                            : Colors.black.withOpacity(.6),
                        style: TextStyle(
                            color: AppCubit.get(context).isDark
                                ? Colors.grey[200]
                                : Colors.black.withOpacity(.6)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                        controller: passwordConfirmation,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: cubit.passwordVisible,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        label: "Password Confirmation",
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Password mustn't be empty!!";
                          }
                          return null;
                        },
                        radius: 20.0,
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(
                                email: email.text,
                                password: password.text,
                                name: name.text,
                                passwordConfiramation:
                                    passwordConfirmation.text);
                          }
                        },
                        generalWidgetsColor: AppCubit.get(context).isDark
                            ? Colors.grey[200]
                            : Colors.black.withOpacity(.6),
                        style: TextStyle(
                            color: AppCubit.get(context).isDark
                                ? Colors.grey[200]
                                : Colors.black.withOpacity(.6)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => defaultButton(
                          text: "Sign Up",
                          redius: 60.0,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                  email: email.text,
                                  password: password.text,
                                  name: name.text,
                                  passwordConfiramation:
                                      passwordConfirmation.text);
                            }
                          },
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
