// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Text(
              "New & Hot",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500)),
            ),
            actions: [
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
            bottom: TabBar(
              labelColor: kblackcolor,
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: kwhiteColor, borderRadius: BorderRadius.circular(30)),
              tabs: [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [_buildComingSoon(context), _builEveryonesWatching()],
          ),
        ),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        kheight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "FEB",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(156, 158, 158, 158)),
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.network(
                          "https://www.themoviedb.org/t/p/w250_and_h141_face/tFlSDoWQsAZ2qjICKzfP5Yw6zM5.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          radius: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_down_alt,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _builEveryonesWatching() {
  return SizedBox();
}
