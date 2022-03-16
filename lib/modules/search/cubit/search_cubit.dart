import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/search/cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

// SearchModel? searchModel;
//
// void searchProducts(String text) {
//   emit(SearchLoadingState());
//   DioHelper.postData(
//     url: SEARCH,
//     data: {"text": text},
//     authToken: token,
//   ).then((value) {
//     searchModel = SearchModel.fromJson(value.data);
//     emit(SearchSuccessState(searchModel!));
//   }).catchError((error) {
//     print(error.toString());
//     emit(SearchFailureState(error.toString()));
//   });
// }
}
