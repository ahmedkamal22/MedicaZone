abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

// class SearchSuccessState extends SearchStates {
//   final SearchModel searchModel;
//
//   SearchSuccessState(this.searchModel);
// }

class SearchFailureState extends SearchStates {
  final String error;

  SearchFailureState(this.error);
}
