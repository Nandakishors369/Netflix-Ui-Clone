import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class CominSoonWidget extends StatelessWidget {
  const CominSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          kwidth,
          SizedBox(
            width: 50,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "FEB",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(156, 158, 158, 158)),
                ),
                Text(
                  "11",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 60,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWIdget(),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "TALL GIRL 2",
                      style: TextStyle(
                          letterSpacing: -5,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const CUstomButtonWidget(
                          icon: Icons.notifications_outlined,
                          title: "Remind Me",
                          iconsize: 20,
                          fontsize: 12,
                        ),
                        kwidth,
                        const CUstomButtonWidget(
                          icon: Icons.info_outline,
                          title: "info",
                          iconsize: 20,
                          fontsize: 12,
                        ),
                        kwidth
                      ],
                    )
                  ],
                ),
                kheight,
                const Text("Coming On Friday"),
                kheight,
                const Text(
                  "Tall Girl 2",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight,
                const Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.''',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
