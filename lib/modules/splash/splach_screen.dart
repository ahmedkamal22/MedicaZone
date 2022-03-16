import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/home.dart';
import '../../models/onboarding/onboarding.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/splash_cubit.dart';
import 'cubit/splash_states.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<OnBoadringModel> list = [
      OnBoadringModel(
        image:
            "https://img.freepik.com/free-photo/doctor-s-hand-with-stethoscope-medical-equipment-s-white-background_23-2148129660.jpg?size=626&ext=jpg",
        title: "Looking for medical items",
      ),
      OnBoadringModel(
        image:
            "https://lawfulrebel.com/wp-content/uploads/2017/09/Thinking-Image-10.jpg",
        title: "Discover the best medicine tools",
      ),
      OnBoadringModel(
        image:
            "https://www.vapulus.com/en/wp-content/uploads/2019/04/Payment-Methods-for-e-commerce.png",
        title: "Choose your appropriate payment method ",
      ),
    ];
    var boardController = PageController();
    void submit() {
      CacheHelper.saveData(key: onBoardingKeyValue, value: true).then((value) {
        if (value) {
          navigateAndFinish(
            context,
            Home(),
          );
        }
      });
    }

    return BlocProvider(
      create: (BuildContext context) => SplashCubit(),
      child: BlocConsumer<SplashCubit, SplashSates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SplashCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Medica Zone",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text(
                      "Skip Intro",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                    )),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == list.length - 1) {
                          cubit.changeState();
                        }
                      },
                      itemBuilder: (context, index) =>
                          buildBoardingItem(list[index], context),
                      itemCount: list.length,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        count: list.length,
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 10.0,
                          strokeWidth: 10.0,
                          activeDotColor: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          if (cubit.isLast) {
                            submit();
                          } else {
                            boardController.nextPage(
                                duration: Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        mini: true,
                        child: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBoardingItem(OnBoadringModel model, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: NetworkImage("${model.image}"))),
          Text(
            "${model.title}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 25.0,
                ),
          ),
          SizedBox(
            height: 15,
          ),
          // Text(
          //   "${model.body}",
          //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
          //         fontSize: 14.0,
          //       ),
          // ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}
