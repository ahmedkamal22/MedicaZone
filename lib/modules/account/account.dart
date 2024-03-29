import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/login/cubit/login_cubit.dart';
import 'package:mediica_zone/modules/login/cubit/login_state.dart';
import 'package:mediica_zone/modules/login/login.dart';
import 'package:mediica_zone/modules/register/cubit/register_state.dart';
import 'package:mediica_zone/modules/register/register.dart';
import 'package:mediica_zone/shared/components/components.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = LoginCubit.get(context).loginModel;
        name.text = (model == null) ? '' : model.user!.name!;
        email.text = (model == null) ? '' : model.user!.email!;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is! LoginSuccessState)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahlan! Nice to meet you",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black.withOpacity(.7),
                                  height: 1.3,
                                  fontSize: 20.0),
                        ),
                        Text(
                          "The region's favourite online marketplace",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    height: 1.3,
                                  ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.yellowAccent,
                                  child: IconButton(
                                      onPressed: () {
                                        navigateTo(context, LoginScreen());
                                      },
                                      icon: Icon(Icons.person)),
                                ),
                                Text(
                                  "Sign In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppCubit.get(context).isDark
                                            ? Colors.white
                                            : Colors.black.withOpacity(.7),
                                        fontSize: 15.0,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.yellowAccent,
                                  child: IconButton(
                                      onPressed: () {
                                        navigateTo(context, RegisterScreen());
                                      },
                                      icon: Icon(Icons.person_add_alt)),
                                ),
                                Text(
                                  "Sign Up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppCubit.get(context).isDark
                                            ? Colors.white
                                            : Colors.black.withOpacity(.7),
                                        fontSize: 15.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  if (state is RegisterSuccessState)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                          height: 30,
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
                          height: 30,
                        ),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: "Sign Out",
                            redius: 20)
                      ],
                    ),
                  if (state is LoginSuccessState)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                          height: 30,
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
                          height: 30,
                        ),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: "Sign Out",
                            redius: 20)
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
