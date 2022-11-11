// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/custom_button.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String description;
  const EveryoneWatchingWidget({
    Key? key,
    required this.movieName,
    required this.posterPath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
          Text(
            movieName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight,
          Text(
            description,
            style: const TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 40),
          VideoWidget(
            image: posterPath,
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                title: 'Share',
                icon: Icons.share,
                titleSize: 16,
                iconSize: 25,
              ),
              kwidth,
              CustomButton(
                title: 'My List',
                icon: Icons.add,
                titleSize: 16,
                iconSize: 25,
              ),
              kwidth,
              CustomButton(
                title: 'Play',
                icon: Icons.play_arrow,
                titleSize: 16,
                iconSize: 25,
              ),
              kwidth,
            ],
          ),
        ],
      ),
    );
  }
}
