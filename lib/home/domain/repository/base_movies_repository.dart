import 'package:dartz/dartz.dart';


import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_movie_recommendation_usecase.dart';
import '../usecases/get_trending_movies_usecase.dart';
import '../usecases/get_top_rated_movies_usecase.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getUpComingMovies();
  Future<Either<Failure,List<Movie>>> getTrendingMovies(TrendingMoviesPageParameter parameter);
  Future<Either<Failure,List<Movie>>> getTopRatedMovies(TopRatedMoviesPageParameter parameter);
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameter parameter);
  Future<Either<Failure,List<Recommendation>>> getMovieRecommendation(MovieRecommendationParameter parameter);



} 