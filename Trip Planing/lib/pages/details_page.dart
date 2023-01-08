import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_cubit_states.dart';
import 'package:project/cubit/app_cubits.dart';
import 'package:project/widgets/app_buttons.dart';
import 'package:project/widgets/app_largetext.dart';
import 'package:project/widgets/app_text.dart';
import 'package:project/widgets/colors.dart';
import 'package:project/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,

            ////// Stack to overlap the Container ////////

            child: Stack(
              children: [
                ////////////  Image   ////////////
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                ///////// Menu /////////
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(
                          Icons.arrow_left_outlined,
                          size: 40,
                        ),
                        // color: Colors.white,
                      ),
                    ],
                  ),
                ),
                //////////  Overlaped Container   //////////
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /////  Text and rate   //////////
                              AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8),
                                size: 30,
                              ),
                              AppLargeText(
                                text: "\$" + detail.place.price.toString(),
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              /////////  Icone and subtitle  ///////////
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detail.place.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ////////////  Wrap class is used to align or adjust multiple widgets vertically or horizontally//////////////
                              /// //////   Star Icons /////////////
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "(5.0)",
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          //////////    Text  and subtext  //////////////
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of prople in your group",
                            size: 15,
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ////////////////     like pagenation onTap event      ////////////
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    bacgroundcolor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackgroung,
                                    bordercolor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackgroung,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          /// Text
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          ///meaasage
                          AppText(
                            text: detail.place.description,
                            color: AppColors.mainTextColor,
                          ),
                        ]),
                  ),
                ),

                Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        ///////////// favorite Icon /////////////
                        AppButtons(
                          size: 60,
                          color: AppColors.textColor1,
                          bacgroundcolor: Colors.white,
                          bordercolor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        //////////// Book my trip button //////////////
                        responsiveButton(isresponsive: true),
                      ],
                    )),
              ],
            )),
      );
    });
  }
}
