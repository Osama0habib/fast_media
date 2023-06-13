import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../../../core/error/failure.dart';
import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<List<Recommendation> , MovieRecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(MovieRecommendationParameter parameters) async =>
      await baseMoviesRepository.getMovieRecommendation(parameters);
}

class MovieRecommendationParameter extends Equatable {

  final int id;

  const MovieRecommendationParameter({required this.id});

  @override
  List<Object> get props => [id];
}