import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class AddToFavoriteUseCase extends BaseUseCase<void, AddToFavoriteParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  AddToFavoriteUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, void>> call(AddToFavoriteParameter parameters) async =>
      await baseMoviesRepository.addToFavorite(parameters);
}

class AddToFavoriteParameter extends Equatable {
  final int movieId;
  final Movie movie;

  const AddToFavoriteParameter( {required this.movieId,required this.movie,});

  @override
  List<Object> get props => [
        movieId,
    movie
      ];
}
