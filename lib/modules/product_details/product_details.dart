import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/layout/cubit/home_cubit.dart';
import 'package:mediica_zone/layout/cubit/home_states.dart';
import 'package:mediica_zone/shared/cubit/app_cubit.dart';

import '../../models/product/Product.dart';

class ProductDetails extends StatelessWidget {
  Product product;

  ProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return ConditionalBuilder(
                condition: true,
                builder: (context) => buildProductDetailsItem(product, context),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()));
          }),
    );
  }

  Widget buildProductDetailsItem(Product model, context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${model.brand!.brandNameEn}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${model.productNameEn!.toUpperCase()}",
              style: TextStyle(
                color: AppCubit.get(context).isDark?Colors.white:Colors.black.withOpacity(.7),
              ),
            ),
            Container(
              color: Colors.green,
              width: 40,
              height: 25,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model.rate}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
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
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
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
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        SizedBox(
                          width: 10,
                        ),
                        if (model.discountPrice != null)
                          Container(
                            color: Colors.green.withOpacity(.2),
                            child: Text(
                              '${model.id}% OFF',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        Spacer(),
                        if (model.discountPrice == null)
                          SizedBox(
                            height: 15,
                          ),
                        if (model.discountPrice != null)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Discount",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                          ),
                        if (model.discountPrice == null)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "New",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
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
