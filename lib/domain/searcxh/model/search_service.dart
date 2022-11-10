import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/Main%20Failure/main_failure.dart';
import 'package:netflix_clone/domain/searcxh/model/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
