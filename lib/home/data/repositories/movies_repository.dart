import 'package:dartz/dartz.dart';


import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../../domain/usecases/get_popluar_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../data_sources/remote_data_source/remote_movie_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getUpComingMovies() async {
    final result = await baseMovieRemoteDataSource.getUpComingMovies();
    return sharedResult(result);
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies(PopularMoviesPageParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getTrendingMovies(parameter);
    return sharedResult(result);
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(TopRatedMoviesPageParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies(parameter);
    return sharedResult(result);
  }


  Either<Failure, List<Movie>> sharedResult(result) {
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameter parameter) async {
   final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
   try {
     return Right(result);
   } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(MovieRecommendationParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getMovieRecommendation(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
