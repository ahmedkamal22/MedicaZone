import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/modules/product_details/product_details.dart';
import 'package:mediica_zone/shared/components/components.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
import '../../models/deals/deals.dart';
import '../../shared/styles/colors.dart';

class DealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            color: AppCubit.get(context).isDark ? color : Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.56,
              children: List.generate(
                  cubit.dealsModel!.data!.items!.length,
                  (index) => InkWell(
                    onTap: () {
                      navigateTo(context,
                          ProductDetails(cubit.homeModel!.data!.data![index]));
                    },
                    child: buildDealsItem(
                        cubit.dealsModel!.data!.items![index], context),
                  )),
            ),
          ),
        );
        // return ListView.separated(
        //     itemBuilder: (context, index) =>
        //         buildDealsItem(cubit.dealsModel!.data!.items![index], context),
        //     separatorBuilder: (context, index) => myDivider(),
        //     itemCount: cubit.dealsModel!.data!.items!.length);
      },
    );
  }

  Widget buildDealsItem(DealsItems model, context) => Container(
        color: AppCubit.get(context).isDark ? color : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    color: Colors.white,
                    child: Image(
                      image: NetworkImage(
                        "${model.productThambnail}",
                      ),
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // HomeCubit.get(context)
                      //     .changeFavourites(productsModel.id);
                      print(model.id);
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 22.0,
                      color: Colors.blueGrey,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.productNameEn!.toUpperCase()}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black.withOpacity(.7),
                          fontSize: 15.0,
                          height: 1.3,
                          fontWeight: FontWeight.bold),
                    ),
                    if (model.discountPrice != null)
                      Text(
                        "${model.discountPrice} EGP",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: AppCubit.get(context).isDark
                                ? Colors.lightBlueAccent
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    if (model.discountPrice == null)
                      SizedBox(
                        height: 10,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${model.sellingPrice} EGP",
                          style: TextStyle(
                              decoration: model.discountPrice != null
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize:
                                  model.discountPrice != null ? 14.0 : 17.0,
                              color: model.discountPrice != null
                                  ? Colors.grey
                                  : AppCubit.get(context).isDark
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                        ),
                        Spacer(),
                        if (model.discountPrice != null)
                          Text(
                            '${model.id}% OFF',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (model.discountPrice == null)
                      SizedBox(
                        height: 15,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // if (model.discountPrice != null)
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Express",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ),
                        // if (model.discountPrice == null)
                        //   Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.yellowAccent,
                        //         borderRadius:
                        //         BorderRadiusDirectional.circular(10)),
                        //     padding: EdgeInsets.symmetric(horizontal: 10.0),
                        //     child: Text(
                        //       "New",
                        //       style: TextStyle(
                        //           color: Colors.black, fontSize: 14.0),
                        //     ),
                        //   ),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          "${model.rate}",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
