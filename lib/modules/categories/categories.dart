import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/models/categories/categories_model.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
import '../../shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) => buildCategoriesItems(
                cubit.categoriesModel!.allData!.data[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.categoriesModel!.allData!.data.length);
      },
    );
  }

  Widget buildCategoriesItems(CatData models, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Container(
            //   height: 120,
            //   width: 120,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       image: DecorationImage(
            //         image: NetworkImage("${models.categoryIcon}"),
            //         fit: BoxFit.cover,
            //       )),
            // ),
            // CircleAvatar(
            //   radius: 10,
            //   child: Icon(models.categoryIcon),
            // ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "${models.categoryNameEn}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20.0,
                    ),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.blueAccent),
          ],
        ),
      );
}
