import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/custom_button.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kMainImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(icon: Icons.add, title: 'My List'),
                playButton(),
                const CustomButton(icon: Icons.info, title: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton playButton() {
  return TextButton.icon(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: kblackcolor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Text(
        'Play',
        style: TextStyle(fontSize: 20, color: kblackcolor),
      ),
    ),
  );
}
