import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/application/Downloads/downloads_bloc.dart';
import 'package:netflix_clone/infrastructure/downloads/downloads_repository.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}

void setup() {
  // getIt.registerSingleton<HomeRepository>(HomeRepository(),signalsReady: true);
  getIt.registerFactory<DownloadsBloc>(
      () => DownloadsBloc(DownloadsRespository()));
}
