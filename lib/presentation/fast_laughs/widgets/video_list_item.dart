import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://www.themoviedb.org/t/p/w220_and_h330_face/kjFDIlUCJkcpFxYKtE6OsGcAfQQ.jpg")),
                    ),
                    kheight,
                    VideoAction(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoAction(icon: Icons.add, title: "My List"),
                    VideoAction(icon: Icons.near_me, title: "Share"),
                    VideoAction(icon: Icons.play_arrow, title: "Play")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoAction extends StatelessWidget {
  final IconData icon;
  final String title;
  VideoAction({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kButtonColorWhite,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
