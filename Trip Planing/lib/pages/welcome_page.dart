import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_cubits.dart';
import 'package:project/widgets/app_largetext.dart';
import 'package:project/widgets/app_text.dart';
import 'package:project/widgets/colors.dart';
import 'package:project/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome_one1.jpg",
    "welcome_three3.jpg",
    "welcome_two22.jpg",
  ];
  List text = [
    "Trips",
    "Cloud",
    "Forest",
  ];
  List subtitle = [
    "Mountain",
    "Advancher",
    "Nature",
  ];

  List message = [
    "Mountain hikes give you an incredible sense of freedom along with endurance test",
    "Mountain hikes give you an incredible sense of freedom along with endurance like",
    "Mountain hikes give you an incredible sense of freedom along with endurance mass",
  ];

  @override
  Widget build(BuildContext context) {
    ///// Status Bar Color  /////////
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white54, statusBarBrightness: Brightness.dark));
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return
                //////// Images  ////////

                Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/" + images[index]),
                    fit: BoxFit.cover),
              ),

              ////////  Text and Titles  //////

              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: text[index]),
                          AppText(
                            text: subtitle[index],
                            size: 30.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 260,
                            child: AppText(
                              text: message[index],
                              color: AppColors.textColor2,
                              size: 14,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 120,
                              child: Row(children: [
                                responsiveButton(
                                  width: 130.0,
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),

                      //////// Indicator //////

                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)),
                          );
                        }),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
