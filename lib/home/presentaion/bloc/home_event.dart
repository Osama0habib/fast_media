part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUpComingMoviesEvent extends HomeEvent {
  const GetUpComingMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetTrendingMoviesEvent extends HomeEvent {
  const GetTrendingMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends HomeEvent {
  const GetTopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetHomeMoviesEvent extends HomeEvent {
  const GetHomeMoviesEvent();

  @override
  List<Object> get props => [];
}

class AddToFavoriteEvent extends HomeEvent {
  final MovieModel movie;
  const AddToFavoriteEvent(this.movie);

  @override
  List<Object> get props => [movie];
}


