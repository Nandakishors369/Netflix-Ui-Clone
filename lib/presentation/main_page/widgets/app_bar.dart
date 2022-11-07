import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          Text(
            title!,
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
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
    );
  }
}
