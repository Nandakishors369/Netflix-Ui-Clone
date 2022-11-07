import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

final imageurl1 =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/fDhUxDHgjXzLZEzHNgIS75SzaCA.jpg";

class SearchWidgetIdle extends StatelessWidget {
  const SearchWidgetIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextWidget(
          title: "Top Searches",
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchItemTile(),
              separatorBuilder: (context, index) => kheight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageurl1), fit: BoxFit.cover),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle,
          color: Colors.white,
          size: 40,
        )
      ],
    );
  }
}
