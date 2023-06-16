import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;

  const Favorite({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [id, title, backdropPath, voteAverage, releaseDate];
}
