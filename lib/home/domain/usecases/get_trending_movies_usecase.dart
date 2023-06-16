import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetTrendingMoviesUseCase extends BaseUseCase<List<Movie>,TrendingMoviesPageParameter> {

  final BaseMoviesRepository baseMoviesRepository;

  GetTrendingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(TrendingMoviesPageParameter parameters) async {
    return await baseMoviesRepository.getTrendingMovies(parameters);
  }
}

class TrendingMoviesPageParameter extends Equatable {

  final int page;

  const TrendingMoviesPageParameter({required this.page});

  @override
  List<Object> get props => [page];
}