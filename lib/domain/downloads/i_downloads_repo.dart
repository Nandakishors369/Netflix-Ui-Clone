import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/domain/core/Main%20Failure/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
