part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetCastEvent extends MovieDetailsEvent {
  final int movieId ;
  final Category category;
  const GetCastEvent({required this.movieId, required this.category});

  @override
  List<Object> get props => [movieId,category];
}

class GetReviewsEvent extends MovieDetailsEvent {
  final int movieId ;
  final Category category;
  const GetReviewsEvent({required this.movieId, required this.category});

  @override
  List<Object> get props => [movieId,category];
}

class GetVideoEvent extends MovieDetailsEvent {
  final int movieId ;
  final Category category;
  const GetVideoEvent({required this.movieId, required this.category});

  @override
  List<Object> get props => [movieId,category];
}

class AddToFavoriteEvent extends MovieDetailsEvent {
  final int movieId ;
  const AddToFavoriteEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}