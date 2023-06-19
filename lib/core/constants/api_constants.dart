import 'api_enums.dart';

class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "c00d5b419c51279964254b85bcb419c5";
  static const String upComing = "$baseUrl/movie/upcoming?api_key=$apiKey";
  static String baseImageUrl = "https://image.tmdb.org/t/p/";
  static String imageUrl({required path, String quality = 'original'}) =>
      "$baseImageUrl$quality$path";
  // static String trending(Category category) => "$baseUrl/trending/${category.name.split(".").last}?api_key=$apiKey";
  static String trendingMoviesPath(int page, Category category) =>
      "https://api.themoviedb.org/3/trending/${category.name.split('.').last}/day?api_key=$apiKey";
  // فيه غلط هنا وانا كتبت اللي فوق دا بداله
  // static String trendingMoviesPath(int page,Category category) => "$baseUrl/trending/${category.name.split(".").last}/week?page=$page&api_key=$apiKey";
  static String movieDetailsPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey&append_to_response=videos";
  static String getReviews(int id, Category category) =>
      "$baseUrl/${category.name.split(".").last}/$id/reviews?api_key=$apiKey";
  static String getCast(int movieId, Category category) => "$baseUrl/${category.name.split(".").last}/$movieId/credits?api_key=$apiKey";
  static String getVideos(int movieId, Category category) => "$baseUrl/${category.name.split(".").last}/$movieId/videos?api_key=$apiKey";

  static String moviesWithGenres(Category category) =>
      "$baseUrl/discover/${category.name.split(".").last}?api_key=$apiKey";

  static String topRatedMoviewPath =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
}
