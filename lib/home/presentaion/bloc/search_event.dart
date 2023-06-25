part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}


class OnSearchEvent extends SearchEvent {
  final Genres genres;
  final Category category;
  final String? query;
  const OnSearchEvent( {required this.genres, required this.category,required this.query,});

  @override
  List<Object?> get props => [genres,category,query];

}

class SelectCategoryEvent extends SearchEvent {
  final Category category;
  const SelectCategoryEvent( { required this.category,});

  @override
  List<Object> get props => [category];

}

class SelectGenresEvent extends SearchEvent {
  final Genres genres;
  const SelectGenresEvent( { required this.genres,});

  @override
  List<Object> get props => [genres];

}

// class FilterGenresEvent extends SearchEvent {
//   final Genres genres;
//   const FilterGenresEvent( { required this.genres,});
//
//   @override
//   List<Object> get props => [genres];
//
// }


