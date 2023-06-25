import 'package:dartz/dartz.dart';
import 'package:fast_media/home/domain/entities/reviews.dart';
import 'package:fast_media/home/domain/usecases/add_to_favorite.dart';
import 'package:fast_media/home/domain/usecases/get_cast_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_video_usecase.dart';
import 'package:fast_media/home/domain/usecases/search_usecase.dart';


import '../../../core/error/failure.dart';
import '../../data/models/movie_details_model.dart';
import '../entities/cast.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_movie_recommendation_usecase.dart';
import '../usecases/get_reviews_usecase.dart';
import '../usecases/get_trending_movies_usecase.dart';
import '../usecases/get_top_rated_movies_usecase.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getUpComingMovies();
  Future<Either<Failure,List<Movie>>> getTrendingMovies(TrendingMoviesPageParameter parameter);
  Future<Either<Failure,List<Movie>>> getTopRatedMovies(TopRatedMoviesPageParameter parameter);
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameter parameter);
  Future<Either<Failure,List<Recommendation>>> getMovieRecommendation(MovieRecommendationParameter parameter);
  Future<Either<Failure,List<Cast>>> getCast(CastParameter parameter);
  Future<Either<Failure,List<Reviews>>> getReviews(ReviewsParameter parameter);
  Future<Either<Failure,String>> getVideo(VideoParameter parameter);
  Future<Either<Failure,void>> addToFavorite(AddToFavoriteParameter parameter);
  Future<Either<Failure,List<MovieDetailsModel>>> getFavorite(AddToFavoriteParameter parameter);
  Future<Either<Failure,List<Movie>>> search(SearchParameter parameter);








} 