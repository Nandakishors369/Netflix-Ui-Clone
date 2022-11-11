import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';
import 'package:netflix_clone/presentation/widgets/maincard.dart';
import 'package:netflix_clone/presentation/widgets/title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterPathlist,
  }) : super(key: key);

  final String title;
  final List<String> posterPathlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        kheight,
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterPathlist.length,
              (index) => MainCard(
                imageUrl: posterPathlist[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
