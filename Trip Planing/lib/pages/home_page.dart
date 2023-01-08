import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_cubit_states.dart';
import 'package:project/cubit/app_cubits.dart';
import 'package:project/widgets/app_largetext.dart';
import 'package:project/widgets/app_text.dart';
import 'package:project/widgets/colors.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  var images = {
    "jetski1.jpg": "Jet Ski",
    "snorkeling.jpg": "Snorkeling",
    "trucking.jpg": "Trucking",
    "balloning.jpg": "Balloning",
    "kayaking1.jpg": "Kayaking",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, State) {
        if (State is LoadedState) {
          var info = State.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////// Drawer and profile  //////

              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              //////// TITLE //////

              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Dicover"),
              ),
              const SizedBox(
                height: 30,
              ),

              //////// Tab BAR //////
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(right: 20, left: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,

                      ///CircleTabIndicator
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspriration"),
                        Tab(text: "Emotions"),
                      ]),
                ),
              ),

              //////// ListView Images /////////
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ////// Text /////////
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 20,
                    ),
                    AppText(
                      text: "see all",
                      size: 10,
                      color: AppColors.textColor1,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /////////// List  Small Images  ///////////
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.only(
                            //   right: 50,
                            // ),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/" + images.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

////////////////////   Pain Method CircleTabIndicator ////////////////

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
