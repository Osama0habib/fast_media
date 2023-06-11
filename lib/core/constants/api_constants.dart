import 'api_enums.dart';

class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "c00d5b419c51279964254b85bcb419c5";
  static const String upComing = "$baseUrl/movie/upcoming?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
  static String trending(Category category) => "$baseUrl/trending/${category.name.split(".").last}?api_key=$apiKey";
  static String popularMoviesPath(int page,Category category) => "$baseUrl/movie/popular?page=$page&api_key=$apiKey";
  static String movieDetailsPath(int id) => "$baseUrl/movie/$id?api_key=$apiKey&append_to_response=videos" ;
  static String getReviews(int id , Category category) => "$baseUrl/3/${category.name.split(".").last}/$id/reviews";


}