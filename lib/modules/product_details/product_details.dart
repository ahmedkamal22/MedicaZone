import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediica_zone/layout/cubit/home_cubit.dart';
import 'package:mediica_zone/models/home/home_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildProductDetailsItem(),
    );
  }

  Widget buildProductDetailsItem() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nokia",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "asdasd asdasd asdasd asdasd asdasd asdasd asdasd asdasd asdasd asdasd",
              style: TextStyle(
                color: Colors.black.withOpacity(.7),
              ),
            ),
            Container(
              color: Colors.green,
              width: 60,
              height: 25,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '4.3',
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
                        "http://medicazone.online/upload/products/thambnail/1726584113366864.jpg",
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
                    Text(
                      "27844 EGP",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    if (1 == null)
                      SizedBox(
                        height: 10,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "28000 EGP",
                          style: TextStyle(
                              decoration: 1 != null
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize: 1 != null ? 14.0 : 17.0,
                              color: 1 != null ? Colors.grey : Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if (1 != null)
                          Container(
                            color: Colors.greenAccent.shade100,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '22% OFF',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        Spacer(),
                        if (1 != null)
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
                        if (1 == null)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Price Increase",
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
