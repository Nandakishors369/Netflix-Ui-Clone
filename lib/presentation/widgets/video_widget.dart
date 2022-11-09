import 'package:flutter/material.dart';

class VideoWIdget extends StatelessWidget {
  const VideoWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 150,
          child: Image.network(
            "https://www.themoviedb.org/t/p/w250_and_h141_face/tFlSDoWQsAZ2qjICKzfP5Yw6zM5.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_down_alt,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
