import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trolley-Mounted Anesthesia Workstation"),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    color: Colors.white,
                    child: Image(
                      image: NetworkImage(
                        "http://medicazone.online/upload/products/thambnail/1725750806783242.jpg",
                      ),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (1 != null)
                  Container(
                    color: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Discount",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (1 != null)
                        Text(
                          "110000\$",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "120000\$",
                        style: TextStyle(
                            decoration: 1 != null
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 1 != null ? 13.0 : 15.0,
                            color: 1 != null ? Colors.grey : Colors.blue),
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
      ),
    );
  }
}
