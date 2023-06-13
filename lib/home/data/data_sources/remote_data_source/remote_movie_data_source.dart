import 'package:dio/dio.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/core/constants/api_enums.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../../../domain/usecases/get_popluar_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_model.dart';
import '../../models/recommendation_model.dart';



abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<MovieModel>> getTrendingMovies(PopularMoviesPageParameter parameter);
  Future<List<MovieModel>> getTopRatedMovies(TopRatedMoviesPageParameter parameter);
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameter parameter);
}



class MovieRemoteDataSource  extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getUpComingMovies() async{

    final response = await Dio().get(ApiConstant.upComing);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies(PopularMoviesPageParameter parameter) async {
    final response = await Dio().get(ApiConstant.trendingMoviesPath(parameter.page, Category.all));

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies(TopRatedMoviesPageParameter parameter) async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath(parameter.page));

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter) async{
    final response = await Dio().get(ApiConstant.movieDetailsPath(parameter.movieId));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameter parameter) async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameter.id));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data["results"] as List).map((e) => RecommendationModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}