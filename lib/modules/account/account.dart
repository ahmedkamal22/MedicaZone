import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/login/cubit/login_cubit.dart';
import 'package:mediica_zone/modules/login/cubit/login_state.dart';
import 'package:mediica_zone/modules/login/login.dart';
import 'package:mediica_zone/modules/register/register.dart';
import 'package:mediica_zone/shared/components/components.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahlan! Nice to meet you",
                  style: TextStyle(
                      color: AppCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black.withOpacity(.7),
                      fontSize: 20.0,
                      height: 1.3,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "The region's favourite online marketplace",
                  style: TextStyle(
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
                          style: TextStyle(
                              color: AppCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black.withOpacity(.7),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900),
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
                          style: TextStyle(
                              color: AppCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black.withOpacity(.7),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
