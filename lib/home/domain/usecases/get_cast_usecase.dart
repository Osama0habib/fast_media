import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/api_enums.dart';
import '../../../core/error/failure.dart';
import '../entities/cast.dart';
import '../entities/movie_details.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetCastUseCase
    extends BaseUseCase<List<Cast>, CastParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetCastUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Cast>>> call(
      CastParameter parameters) async =>
      await baseMoviesRepository.getCast(parameters);
}

class CastParameter extends Equatable {
  final int movieId;
  final Category category;

  const CastParameter({required this.movieId,required this.category});

  @override
  List<Object> get props => [movieId,category];
}
