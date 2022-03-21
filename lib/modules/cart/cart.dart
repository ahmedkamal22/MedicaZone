// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medica_zone/models/Favourites/favourites_model.dart';
//
// import '../../layout/cubit/home_cubit.dart';
// import '../../layout/cubit/home_states.dart';
// import '../../shared/components/components.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = HomeCubit.get(context);
//         return ConditionalBuilder(
//           condition: state is! FavouritesLoadingState,
//           builder: (context) => ListView.separated(
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) => buildProductsItem(
//                   cubit.favouritesModel!.data!.data![index].product, context),
//               separatorBuilder: (context, index) => myDivider(),
//               itemCount: cubit.favouritesModel!.data!.data!.length),
//           fallback: (context) => Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
// }
