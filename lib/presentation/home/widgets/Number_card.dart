import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w220_and_h330_face/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Positioned(
          left: 15,
          bottom: -16,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 5,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
