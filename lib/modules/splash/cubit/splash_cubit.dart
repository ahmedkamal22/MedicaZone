import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/splash/cubit/splash_states.dart';

class SplashCubit extends Cubit<SplashSates> {
  SplashCubit() : super(SplashInitialState());

  static SplashCubit get(context) => BlocProvider.of(context);

  bool isLast = false;

  void changeState() {
    isLast = !isLast;
    emit(SplashChangeValueState());
  }
}
