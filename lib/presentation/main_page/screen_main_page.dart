import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/screen_dowloads.dart';
// import 'package:netflix_clone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';

import 'package:netflix_clone/presentation/main_page/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflix_clone/presentation/search/screem_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
