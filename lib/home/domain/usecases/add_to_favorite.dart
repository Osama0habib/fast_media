import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
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

  const AddToFavoriteParameter({required this.movieId});

  @override
  List<Object> get props => [
        movieId,
      ];
}
