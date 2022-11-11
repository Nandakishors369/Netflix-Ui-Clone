import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/application/Downloads/downloads_bloc.dart';
import 'package:netflix_clone/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';

import 'package:netflix_clone/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix_clone/domain/new_and_hot/models/new_and_hot.dart';
import 'package:netflix_clone/infrastructure/downloads/downloads_repository.dart';
import 'package:netflix_clone/infrastructure/new_and_hot/new_and_hot_implementation.dart';
import 'package:netflix_clone/infrastructure/search/search_impl.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}

void setup() {
  //getIt.registerSingleton<HomeRepository>(HomeRepository(), signalsReady: true);
  getIt.registerFactory<FastLaughBloc>(
      () => FastLaughBloc(DownloadsRespository()));
}

void setup2() {
  //getIt.registerSingleton<HomeRepository>(HomeRepository(), signalsReady: true);
  getIt.registerFactory<NewAndHotBloc>(
      () => NewAndHotBloc(NewAndHotImplementation()));
}

void setup3() {
  //getIt.registerSingleton<HomeRepository>(HomeRepository(), signalsReady: true);
  getIt.registerFactory<HomeBloc>(() => HomeBloc(NewAndHotImplementation()));
}
