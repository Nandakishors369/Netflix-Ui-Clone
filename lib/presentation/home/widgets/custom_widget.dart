import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CUstomButtonWidget extends StatelessWidget {
  const CUstomButtonWidget(
      {Key? key,
      required this.icon,
      this.iconsize = 25,
      this.fontsize = 18,
      required this.title})
      : super(key: key);
  final IconData icon;
  final String title;
  final double fontsize;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kButtonColorWhite,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontsize),
        )
      ],
    );
  }
}
