// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_widget.dart';
import 'package:netflix_clone/presentation/hot%20&%20new/widgets/comin_soon_widget.dart';
import 'package:netflix_clone/presentation/hot%20&%20new/widgets/everyones_watching.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

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
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CominSoonWidget();
      },
      itemCount: 10,
    );
  }
}

Widget _builEveryonesWatching() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => EveryonesWatching(),
        itemCount: 10,
      ));
}
