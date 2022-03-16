import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediica_zone/models/slider/slider_model.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../layout/cubit/home_states.dart';
import '../../models/categories/categories_model.dart';
import '../../models/home/home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // if (state is FavouritesChangeSuccessState) {
        //   if (state.changeFavouritesModel.status! == false) {
        //     showToast(
        //         message: state.changeFavouritesModel.message,
        //         states: ToastStates.FAILURE);
        //   }
        // }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.sliderModel != null &&
              cubit.homeModel != null &&
              cubit.categoriesModel != null,
          builder: (context) => productsBuilder(cubit.sliderModel!,
              cubit.homeModel!, cubit.categoriesModel!, context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productsBuilder(SliderModel sliderModel, HomeModel homeModel,
          CategoriesModel categoriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: sliderModel.data!
                    .map((e) => Image(
                          image: NetworkImage(
                              "http://medicazone.online/${e.sliderImg}"),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildCategories(
                            categoriesModel.allData!.data[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10.0),
                        itemCount: categoriesModel.allData!.data.length),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Products",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.grey[300],
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1 / 1.6,
                  children: List.generate(
                    homeModel.allData!.data!.length,
                    (index) => buildProducts(homeModel.allData!.data![index]),
                  ),
                ))
          ],
        ),
      );

  Widget buildProducts(HomeData model) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                    "http://medicazone.online/${model.productThambnail}",
                  ),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                // if (brand.)
                //   Container(
                //     color: Colors.red,
                //     padding:
                //     EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                //     child: Text(
                //       "Discount",
                //       style: TextStyle(color: Colors.white, fontSize: 11.0),
                //     ),
                //   ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "${model.productNameEn}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.0,
                        height: 1.3,
                        fontWeight: FontWeight.bold),
                  ),
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
                      // if (productsModel.discount != 0)
                      if (model.discountPrice != null)
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
            ),
          ],
        ),
      );

  Widget buildCategories(CatData model) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Container(
          //   height: 100,
          //   width: 100,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       image: DecorationImage(
          //         image: NetworkImage("http://medicazone.online/${model.categoryIcon}"),
          //         fit: BoxFit.cover,
          //       )),
          // ),,
          CircleAvatar(
            radius: 10,
            child: Icon(model.categoryIcon),
          ),
          Container(
            color: Colors.black.withOpacity(.8),
            width: 100,
            child: Text(
              "${model.categoryNameEn}",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}
