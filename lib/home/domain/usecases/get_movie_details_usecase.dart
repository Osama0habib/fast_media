import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
          MovieDetailsParameter parameters) async =>
      await baseMoviesRepository.getMovieDetails(parameters);
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
