import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/Downloads/downloads_bloc.dart';
import 'package:netflix_clone/application/Search/search_bloc/search_bloc.dart';
import 'package:netflix_clone/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

import 'application/home/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  setup();
  setup2();
  setup3();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NewAndHotBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FastLaughBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.blue,
          backgroundColor: backgroundcolor,
          scaffoldBackgroundColor: backgroundcolor,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.montserrat(
              textStyle: const TextStyle(color: Colors.white),
            ),
            bodyText2: GoogleFonts.montserrat(
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
