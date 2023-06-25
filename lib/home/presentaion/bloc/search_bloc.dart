import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/core/constants/api_enums.dart';

import '../../domain/entities/genres.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchUseCase searchUseCase ;
  SearchBloc(this.searchUseCase) : super(const SearchState()) {
      on<OnSearchEvent>(_search);
      on<SelectCategoryEvent>(_selectCategory);
      on<SelectGenresEvent>(_selectGenres);

  }

  Future<FutureOr<void>> _search(OnSearchEvent event, Emitter<SearchState> emit) async {
    if(event.query != null || event.query!.length < 3) {
      emit(state.copyWith(requestState: RequestState.loading));
      final result = await searchUseCase(
          SearchParameter(category: Category.all,
              genres: event.genres,
              query: event.query!));
      result.fold(
              (l) =>
              emit(state.copyWith(
                  requestState: RequestState.error,
                  errorMsg: l.message)),
              (r) {
            final result = r.where((element) =>
                element.genreIds.contains(event.genres.id)).toList();
            emit(state.copyWith(
                requestState: RequestState.loaded,
                searchResult: result));
          });
    }
  }



  FutureOr<void> _selectCategory(SelectCategoryEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(category: event.category));
  }

  FutureOr<void> _selectGenres(SelectGenresEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(genres: event.genres));
  }


}
