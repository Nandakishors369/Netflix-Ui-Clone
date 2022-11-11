import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/Main%20Failure/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/models/new_and_hot.dart';

abstract class NewAndHotServices {
  Future<Either<MainFailure, NewAndHotResp>> getnewAndHotMovieData();
  Future<Either<MainFailure, NewAndHotResp>> getnewAndHotTvData();
}
