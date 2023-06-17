import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String overview;
  final bool isFavorite;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
        isFavorite
      ];
}
