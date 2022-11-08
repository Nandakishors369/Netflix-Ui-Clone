import 'package:flutter/material.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/7ze7YNmUaX81ufctGqt0AgHxRtL.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
