import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';
import 'package:fast_media/home/data/models/movie_details_model.dart';
import 'package:fast_media/home/domain/entities/cast.dart';
import 'package:fast_media/home/domain/entities/reviews.dart';
import 'package:fast_media/home/domain/usecases/add_to_favorite.dart';
import 'package:fast_media/home/domain/usecases/get_cast_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_reviews_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_trending_movies_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_video_usecase.dart';
import 'package:fast_media/home/domain/usecases/search_usecase.dart';


import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../domain/usecases/remove_from_favorite.dart';
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
  Future<Either<Failure, List<Movie>>> getTrendingMovies(TrendingMoviesPageParameter parameter) async {
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

  @override
  Future<Either<Failure, List<Cast>>> getCast(CastParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getCast(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Reviews>>> getReviews(ReviewsParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getReviews(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getVideo(VideoParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getVideo(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorite(AddToFavoriteParameter parameter) async {
    final result = await baseMovieRemoteDataSource.addToFavorite(parameter);
    try {
      return Right(result);
    } on FirebaseException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  // @override
  // Future<Either<Failure, List<MovieDetailsModel>>> getFavorite(AddToFavoriteParameter parameter) async {
  //   final result = await baseMovieRemoteDataSource.getFavorite(parameter);
  //   try {
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   } on FirebaseException catch(failure) {
  //     throw FirebaseException(plugin: failure.plugin,message: failure.message,code: failure.code,stackTrace: failure.stackTrace);
  //   }
  // }

  @override
  Future<Either<Failure, List<Movie>>> search(SearchParameter parameter) async {
    final result = await baseMovieRemoteDataSource.search(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on FirebaseException catch(failure) {
      throw FirebaseException(plugin: failure.plugin,message: failure.message,code: failure.code,stackTrace: failure.stackTrace);
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorite(RemoveFromFavoriteParameter parameter) async {
    final result = await baseMovieRemoteDataSource.removeFromFavorite(parameter);
    try {
      return Right(result);
    } on FirebaseException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteModel>>> getFavorite(NoParameter parameter) {
    // TODO: implement getFavorite
    throw UnimplementedError();
  }
}
