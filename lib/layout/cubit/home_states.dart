abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeChangeBottomNavState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeFailureState extends HomeStates {
  final String error;

  HomeFailureState(this.error);
}

class CategoriesSuccessState extends HomeStates {}

class CategoriesLoadingState extends HomeStates {}

class CategoriesFailureState extends HomeStates {
  final String error;

  CategoriesFailureState(this.error);
}

class DealsLoadingState extends HomeStates {}

class DealsSuccessState extends HomeStates {
  DealsSuccessState();
}

class DealsFailureState extends HomeStates {
  final String error;

  DealsFailureState(this.error);
}

class SliderLoadingState extends HomeStates {}

class SliderSuccessState extends HomeStates {
  SliderSuccessState();
}

class SliderFailureState extends HomeStates {
  final String error;

  SliderFailureState(this.error);
}

class SearchLoadingState extends HomeStates {}

class SearchSuccessState extends HomeStates {
  SearchSuccessState();
}

class SearchFailureState extends HomeStates {
  final String error;

  SearchFailureState(this.error);
}

class ProductDetailsLoadingState extends HomeStates {}

class ProductDetailsSuccessState extends HomeStates {
  ProductDetailsSuccessState();
}

class ProductDetailsFailureState extends HomeStates {
  final String error;

  ProductDetailsFailureState(this.error);
}

class UserProfileLoadingState extends HomeStates {}

class UserProfileSuccessState extends HomeStates {
  UserProfileSuccessState();
}

class UserProfileFailureState extends HomeStates {
  final String error;

  UserProfileFailureState(this.error);
}