import 'package:dio/dio.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/core/constants/api_enums.dart';
import 'package:fast_media/home/domain/entities/reviews.dart';
import 'package:fast_media/home/domain/usecases/get_cast_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_reviews_usecase.dart';
import 'package:fast_media/home/domain/usecases/get_video_usecase.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../domain/entities/cast.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../../../domain/usecases/get_trending_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../models/cast_model.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_model.dart';
import '../../models/recommendation_model.dart';
import '../../models/reviews_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<MovieModel>> getTrendingMovies(
      TrendingMoviesPageParameter parameter);
  Future<List<MovieModel>> getTopRatedMovies(
      TopRatedMoviesPageParameter parameter);
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);
  Future<List<RecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameter parameter);
  Future<List<Cast>> getCast(
      CastParameter parameter);
  Future<List<Reviews>> getReviews(
      ReviewsParameter parameter);
  Future<String> getVideo(
      VideoParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getUpComingMovies() async {
    final response = await Dio().get(ApiConstant.upComing);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies(
      TrendingMoviesPageParameter parameter) async {
    final response = await Dio()
        .get(ApiConstant.trendingMoviesPath(parameter.page, Category.all));

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies(
      TopRatedMoviesPageParameter parameter) async {
    final response = await Dio().get(ApiConstant.topRatedMoviewPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.movieDetailsPath(parameter.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameter parameter) async {
    final response = await Dio().get(ApiConstant.baseImageUrl);
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Cast>> getCast(CastParameter parameter) async{
    print(ApiConstant.getCast(parameter.movieId, parameter.category));
    final response = await Dio().get(ApiConstant.getCast(parameter.movieId, parameter.category));
    if (response.statusCode == 200) {
      print(response.data);
    return List<Cast>.from((response.data["cast"] as List)
        .map((e) => CastModel.fromJson(e)));
    } else {
    throw ServerException(
    errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Reviews>> getReviews(ReviewsParameter parameter) async {
    final response = await Dio().get(ApiConstant.getReviews(parameter.movieId, parameter.category));
    if (response.statusCode == 200) {
      return List<Reviews>.from((response.data["results"] as List)
          .map((e) => ReviewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<String> getVideo(VideoParameter parameter) async {
    final response = await Dio().get(ApiConstant.getVideos(parameter.movieId, parameter.category));
    if (response.statusCode == 200) {
      return response.data["results"][0]["key"];
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
