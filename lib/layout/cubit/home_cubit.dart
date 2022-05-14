import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/models/home/home_model.dart';
import 'package:mediica_zone/models/search/search_model.dart';
import 'package:mediica_zone/models/slider/slider_model.dart';
import 'package:mediica_zone/shared/components/components.dart';

import '../../models/categories/categories_model.dart';
import '../../models/deals/deals.dart';
import '../../modules/categories/categories.dart';
import '../../modules/deals/deals.dart';
import '../../modules/products/products.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    DealsScreen(),
    // AccountScreen(),
    // CartScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet_giftcard_sharp),
      label: "categories",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.discount_outlined),
      label: "Deals",
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.person_outline),
    //   label: "My Account",
    // ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.shopping_cart),
    //   label: "Cart",
    // ),
  ];
  int currentIndex = 0;

  changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(url: HOME).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeFailureState(error.toString()));
    });
  }

  SliderModel? sliderModel;

  void getSliderImages() {
    emit(SliderLoadingState());
    DioHelper.getData(url: SLIDER).then((value) {
      sliderModel = SliderModel.fromJson(value.data);
      emit(SliderLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(SliderFailureState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(CategoriesLoadingState());
    DioHelper.getData(url: CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      showFullText(error.toString());
      emit(CategoriesFailureState(error.toString()));
    });
  }

  DealsModel? dealsModel;

  void getDealsData() {
    emit(DealsLoadingState());
    DioHelper.getData(url: DEALS).then((value) {
      dealsModel = DealsModel.fromJson(value.data);
      emit(DealsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DealsFailureState(error.toString()));
    });
  }

  SearchModel? searchModel;

  void getSearch({String text = ""}) {
    emit(SearchLoadingState());
    DioHelper.getData(url: SEARCH + text).then((value) {
      searchModel= SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchFailureState(error.toString()));
    });

  }
}
