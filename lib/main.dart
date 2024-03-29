import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediica_zone/modules/login/cubit/login_cubit.dart';
import 'package:mediica_zone/modules/register/cubit/register_cubit.dart';
import 'package:mediica_zone/shared/components/constants.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';
import 'package:mediica_zone/shared/cubit/app_states.dart';
import 'package:mediica_zone/shared/network/local/cache_helper.dart';
import 'package:mediica_zone/shared/network/remote/dio_helper.dart';
import 'package:mediica_zone/shared/styles/themes.dart';

import 'layout/cubit/home_cubit.dart';
import 'layout/home.dart';
import 'modules/splash/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51L7NLXHjmyadU3ZuKjuHJHDfj37tZTTwfG14BCmuC3EcJErcp7eVbo33omnjpF3onclMvnUBUz7xXP81UCTydXKo00fT53Bykd';
  await Stripe.instance.applySettings();
  DioHelper.int();
  await CacheHelper.int();
  Widget widget;
  bool? isDark = CacheHelper.getBooleanData(key: "isDark");
  bool? onBoarding = CacheHelper.getData(key: onBoardingKeyValue);
  token = CacheHelper.getData(key: tokenKeyValue);
  if (token != null) print(token);
  if (onBoarding != null)
    widget = Home();
  else
    widget = SplashScreen();

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDark,
        startScreen: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startScreen;

  MyApp({this.isDark, this.startScreen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                AppCubit()..changeMode(fromShared: isDark)),
        BlocProvider(
            create: (BuildContext context) => HomeCubit()
              ..getDealsData()
              ..getHomeData()
              ..getSliderImages()
              ..getCategoriesData()
              ..getUserData()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startScreen,
          );
        },
      ),
    );
  }
}