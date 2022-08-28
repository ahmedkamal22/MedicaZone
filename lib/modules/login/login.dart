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
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status == true) {
            CacheHelper.saveData(
                    key: tokenKeyValue,
                    value: 'Bearer ' + state.loginModel.accessToken!)
                .then((value) {
              token = "${'Bearer ' + state.loginModel.accessToken!}";
              navigateAndFinish(context, Home());
            });
          } else {
            showToast(
                message: state.loginModel.message, states: ToastStates.FAILURE);
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Medica Zone"),
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
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Email mustn't be empty!!";
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
                          ;
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
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                email: email.text, password: password.text);
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}
