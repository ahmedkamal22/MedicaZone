import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/network/local/cache_helper.dart';
import '../register/register.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  var email = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == true) {
              CacheHelper.saveData(
                      key: tokenKeyValue, value: state.loginModel.accessToken)
                  .then((value) {
                token = "${state.loginModel.accessToken}";
                navigateAndFinish(context, Home());
                // showToast(
                //     message: state.loginModel.message,
                //     states: ToastStates.SUCCESS);
              });
            } else {
              showToast(
                  message: state.loginModel.message,
                  states: ToastStates.FAILURE);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
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
                            style: TextStyle(
                                color: AppCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black),
                            keyboard_type: TextInputType.emailAddress,
                            controller_type: email,
                            label_text: "Email",
                            prefix_icon: Icons.email,
                            Validate: (emailCheck) {
                              if (emailCheck!.isEmpty) {
                                return "Email mustn't be empty";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          style: TextStyle(
                              color: AppCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black),
                          keyboard_type: TextInputType.visiblePassword,
                          controller_type: password,
                          label_text: "Password",
                          prefix_icon: Icons.lock,
                          suffix_icon: cubit.suffix,
                          isVisible: cubit.passwordVisible,
                          isPasswordVisible: () {
                            cubit.changePasswordVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: email.text, password: password.text);
                            }
                          },
                          Validate: (passwordCheck) {
                            if (passwordCheck!.isEmpty) {
                              return "Password mustn't be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            text: "Sign in",
                            redius: 60.0,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: email.text, password: password.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: Text("Sign Up"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
