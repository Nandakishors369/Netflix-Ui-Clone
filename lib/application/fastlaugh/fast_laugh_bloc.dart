// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/Main Failure/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
];

ValueNotifier<Set<int>> likedVideosListNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  IDownloadsRepo _iDownloadsRepo;

  FastLaughBloc(this._iDownloadsRepo) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //  sending loading to UI
      emit(
        const FastLaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );

      //get trending movies
      final _result = await _iDownloadsRepo.getDownloadsImages();
      final _state = _result.fold((MainFailure failures) {
        return const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> success) {
        return FastLaughState(
          videosList: success,
          isLoading: false,
          isError: false,
        );
      });
      // send to UI
      emit(_state);
    });

    on<LikeVideos>((event, emit) async {
      likedVideosListNotifier.value.add(event.id);
      likedVideosListNotifier.notifyListeners();
    });

    on<UnLikeVideos>((event, emit) async {
      likedVideosListNotifier.value.remove(event.id);
      likedVideosListNotifier.notifyListeners();
    });
  }
}
