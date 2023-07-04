import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';
import 'add_to_favorite.dart';
import 'base_usecase.dart';

class RemoveFromFavoriteUseCase extends BaseUseCase<void, RemoveFromFavoriteParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  RemoveFromFavoriteUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, void>> call(RemoveFromFavoriteParameter parameters) async =>
      await baseMoviesRepository.removeFromFavorite(parameters);
}


class RemoveFromFavoriteParameter extends Equatable {
  final int movieId;

  const RemoveFromFavoriteParameter( {required this.movieId});

  @override
  List<Object> get props => [
        movieId,

      ];
}
