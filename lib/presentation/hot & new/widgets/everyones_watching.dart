import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../home/widgets/custom_widget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.''',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWIdget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CUstomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconsize: 25,
              fontsize: 16,
            ),
            kwidth,
            CUstomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconsize: 25,
              fontsize: 16,
            ),
            kwidth,
            CUstomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconsize: 25,
              fontsize: 16,
            ),
            kwidth
          ],
        )
      ],
    );
  }
}
