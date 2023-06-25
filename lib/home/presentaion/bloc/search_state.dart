part of 'search_bloc.dart';

class SearchState extends Equatable {
  final Category category;
  final Genres? genres;
  final List<Movie> searchResult;
  final RequestState requestState;
  final String errorMsg;

  const SearchState({
    this.category = Category.all,
    this.genres,
    this.errorMsg = "",
    this.searchResult = const [],
    this.requestState = RequestState.initial,
  });

  SearchState copyWith(
      {Category? category,
        Genres? genres,
        List<Movie>? searchResult,
      RequestState? requestState,
      String? errorMsg}) {
    return SearchState(
        category: category?? this.category,
        genres: genres ?? this.genres,
        searchResult: searchResult ?? this.searchResult,
        errorMsg: errorMsg?? this.errorMsg,
        requestState: requestState ?? this.requestState);
  }

  @override
  List<Object?> get props => [searchResult, requestState,errorMsg,category,genres];
}
