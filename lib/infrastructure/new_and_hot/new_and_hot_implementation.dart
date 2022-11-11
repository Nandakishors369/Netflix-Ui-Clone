import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';

import 'package:dartz/dartz.dart';

import '../../domain/core/Main Failure/main_failure.dart';
import '../../domain/new_and_hot/models/new_and_hot.dart';
import '../../domain/new_and_hot/new_and_hot_services.dart';

@LazySingleton(as: NewAndHotServices)
class NewAndHotImplementation implements NewAndHotServices {
  @override
  Future<Either<MainFailure, NewAndHotResp>> getnewAndHotMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.newAndHotMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final result = NewAndHotResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResp>> getnewAndHotTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.newAndHotTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final result = NewAndHotResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
