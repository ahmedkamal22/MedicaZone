import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
import '../../models/search/search_model.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      keyboard_type: TextInputType.text,
                      controller_type: searchController,
                      label_text: "search",
                      prefix_icon: Icons.search,
                      Validate: (String? search) {
                        if (search!.isEmpty) {
                          return "Type Words to search";
                        }
                        return null;
                      },
                      onChange: (value) {
                        cubit.getSearch(text: value);
                      },
                      // onSubmit: (String text) {
                      //   HomeCubit.get(context).searchProducts(text);
                      // },
                      style: TextStyle(
                          color: AppCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildProductsItem(
                            HomeCubit.get(context)
                                    .searchModel!
                                    .data!.data![index],
                                context),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: HomeCubit.get(context)
                                .searchModel!.data!.data!.length),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
Widget buildProductsItem( model, context, {bool oldPrice = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: NetworkImage(
                "${model!.productThambnail}",
              ),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            if (model.discountPrice != 0 && oldPrice)
              Container(
                color: Colors.red,
                padding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Text(
                  "Discount",
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${model.productNameEn}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.0,
                      height: 1.3,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Row(
                children: [
                  Text(
                    "${model.sellingPrice}",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (model.discountPrice != 0 && oldPrice)
                    Text(
                      "${model.discountPrice}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11.0,
                          color: Colors.grey),
                    ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        // HomeCubit.get(context).changeFavourites(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                        // HomeCubit.get(context).favourites[model.id]!
                        //     ? Colors.blue
                        //     : Colors.grey[400],
                        Colors.grey[400],
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);