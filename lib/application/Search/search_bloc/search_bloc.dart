import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/Main%20Failure/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/searcxh/model/search_service.dart';

import '../../../domain/downloads/models/downloads.dart';
import '../../../domain/searcxh/model/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      //get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      // show to ui
      emit(_state);
    });
    // search reslut state
    on<SearchMovie>((event, emit) {
      // call search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      // show to ui
    });
  }
}
