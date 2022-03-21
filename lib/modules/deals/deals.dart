import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
import '../../models/deals/deals.dart';
import '../../shared/components/components.dart';

class DealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                buildDealsItem(cubit.dealsModel!.data[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.dealsModel!.data.length);
      },
    );
  }

  Widget buildDealsItem(Data model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 16),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                    image: NetworkImage(
                      "http://medicazone.online/${model.productThambnail}",
                    ),
                    width: double.infinity,
                    height: 120,
                  ),
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Express",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${model.productNameEn!.toUpperCase()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.0, height: 1.3, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    if (model.discountPrice != null)
                      Text(
                        "${model.discountPrice}",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    SizedBox(
                      width: 10,
                    ),

                    Text(
                      "${model.sellingPrice}",
                      style: TextStyle(
                          decoration: model.discountPrice != null
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: model.discountPrice != null ? 13.0 : 15.0,
                          color: model.discountPrice != null
                              ? Colors.grey
                              : Colors.blue),
                    ),

                    // if (model.sellingPrice != null)
                    //   Text(
                    //     "${model.discountPrice}",
                    //     style: TextStyle(
                    //         fontSize: 15.0,
                    //         color: Colors.blue,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          // HomeCubit.get(context)
                          //     .changeFavourites(productsModel.id);
                          // print(productsModel.id);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[400],
                          // HomeCubit.get(context)
                          //         .favourites[productsModel.id]!
                          //     ? Colors.blue
                          //     : Colors.grey[400],
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
          ],
        ),
      );
}
