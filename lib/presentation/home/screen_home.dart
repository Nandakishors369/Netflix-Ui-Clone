// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/Strings.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_image.dart';
import 'package:netflix_clone/presentation/home/widgets/top_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

import '../../application/home/home_bloc.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(InitializeHome());
    });
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, bool value, Widget? _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.isError) {
                        return Center(
                          child: Text('Somthing error occured'),
                        );
                      } else {
                        // Released Past Year
                        final List<String> pastYear =
                            state.pastYearMovieList.map((m) {
                          return '$imageAppendurl${m.posterPath}';
                        }).toList();
                        pastYear.shuffle();
                        // Trending
                        final List<String> trending =
                            state.trendingMovieList.map((m) {
                          return '$imageAppendurl${m.posterPath}';
                        }).toList();
                        trending.shuffle();
                        // Tense Drama
                        final List<String> tenseDrama =
                            state.tenseDramasMovieList.map((m) {
                          return '$imageAppendurl${m.posterPath}';
                        }).toList();
                        tenseDrama.shuffle();
                        // South Indian
                        final List<String> southIndia =
                            state.southIndiaMovieList.map((m) {
                          return '$imageAppendurl${m.posterPath}';
                        }).toList();
                        southIndia.shuffle();

                        // Top10
                        final List<String> top10 =
                            state.trendingTvList.map((m) {
                          return '$imageAppendurl${m.posterPath}';
                        }).toList();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView(
                            children: [
                              BackgroundImageWidget(),
                              kwidth,
                              MainTitleCard(
                                title: 'Released in the Past Year',
                                posterPathlist: pastYear.sublist(0, 10),
                              ),
                              kwidth,
                              MainTitleCard(
                                title: 'Trending Now',
                                posterPathlist: trending.sublist(0, 11),
                              ),
                              kwidth,
                              TopTitleCard(
                                title: 'Top 10 Tv Shows in India Today',
                                posterPathList: top10.sublist(0, 11),
                              ),
                              kwidth,
                              MainTitleCard(
                                title: 'Tense Dramas',
                                posterPathlist: tenseDrama.sublist(0, 11),
                              ),
                              kwidth,
                              MainTitleCard(
                                title: 'South indian Cinemas',
                                posterPathlist: southIndia.sublist(0, 11),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  value
                      ? Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Image.asset(
                                      'assets/Logo.png',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.cast,
                                          size: 30,
                                          color: kwhiteColor,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('TV Shows',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'Movies',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Catergories',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : kheight
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
