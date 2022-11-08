import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CUstomButtonWidget extends StatelessWidget {
  const CUstomButtonWidget({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kButtonColorWhite,
          size: 25,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
