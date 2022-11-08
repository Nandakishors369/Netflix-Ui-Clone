import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/Number_card.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';
import 'package:netflix_clone/presentation/widgets/maincard.dart';
import 'package:netflix_clone/presentation/widgets/title.dart';

import '../widgets/main_title_card.dart';
import 'widgets/custom_widget.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, value, child) {
        return SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCardWidget(),
                    kheight,
                    MainTitleCard(
                      title: "Released in the past year",
                    ),
                    kheight,
                    MainTitleCard(
                      title: "Trending Now",
                    ),
                    kheight,
                    NumberTitleCard(),
                    kheight,
                    MainTitleCard(title: "Tense Dramas"),
                    kheight,
                    MainTitleCard(title: "South Indian")
                  ],
                ),
                scrollnotifier.value
                    ? Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.network(
                                    "https://pngimg.com/uploads/netflix/netflix_PNG15.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                    )),
                                Container(
                                  color: Colors.blue,
                                  height: 25,
                                  width: 25,
                                ),
                                kwidth
                              ],
                            ),
                            kheight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Tv Shows",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Movies",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight
              ],
            ),
          ),
        );
      },
    ));
  }
}
