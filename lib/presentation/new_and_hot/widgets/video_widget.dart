import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String image;
  const VideoWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          height: 170,
          width: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          errorBuilder: (context, error, trace) {
            return const Center(
                child: Icon(
              Icons.wifi,
              color: Colors.white,
            ));
          },
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: kblackcolor.withOpacity(0.8),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
