import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/Downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/main_page/widgets/app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetsList = [const _smartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Downloads"),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetsList[index],
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          itemCount: _widgetsList.length,
        ));
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        const Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        const Text("Smart Downloads")
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  /*  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/wGE4ImqYjJZQi3xFu4I2OLm8m0w.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/vtfsNxAsDHElFvYHUc9Khwqg17Y.jpg",
  ];
 */
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(DownloadsEvent.getDownloadsImages());
    });

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads For You",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download personalized selection of\n movies and shows for you , so there's \nalways something to watch on your \nphone.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? Center(child: const CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.5),
                            radius: size.width * 0.4,
                          ),
                        ),
                        DownloadsImages(
                          imageList:
                              '$imageAppendUrl${state.downloads![0].posterPath}',
                          angle: -20,
                          margin: const EdgeInsets.only(
                            right: 140,
                            bottom: 50,
                          ),
                          size: Size(size.width * .38, size.width * .58),
                        ),
                        DownloadsImages(
                            imageList:
                                '$imageAppendUrl${state.downloads![2].posterPath}',
                            angle: 20,
                            margin: EdgeInsets.only(left: 140, bottom: 50),
                            size: Size(size.width * .38, size.width * .58)),
                        DownloadsImages(
                            imageList:
                                '$imageAppendUrl${state.downloads![6].posterPath}',
                            angle: 0,
                            margin: EdgeInsets.only(bottom: 15),
                            size: Size(size.width * .43, size.width * .65))
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {},
              color: kButtonColorBlue,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Set up",
                  style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        // kheight,
        MaterialButton(
          onPressed: () {},
          color: kButtonColorWhite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "See what you can download",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: kblackcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImages extends StatelessWidget {
  const DownloadsImages(
      {Key? key,
      required this.imageList,
      required this.angle,
      required this.margin,
      required this.size})
      : super(key: key);

  final String imageList;
  final int? angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    // final Size sizee = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle! * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
