import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
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
                                    .data![index],
                                context),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: HomeCubit.get(context)
                                .searchModel!
                                .data!
                                .length),
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
