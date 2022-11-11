import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/Number_card.dart';
import 'package:netflix_clone/presentation/widgets/title.dart';

class TopTitleCard extends StatelessWidget {
  const TopTitleCard(
      {super.key, required this.title, required this.posterPathList});
  final String title;
  final List<String> posterPathList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterPathList.length,
              (index) => NumberCard(
                index: index + 1,
                size: size,
                posterPath: posterPathList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
