import 'package:fast_media/home/data/models/movie_model.dart';
import 'package:fast_media/home/domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  const FavoriteModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.voteAverage,
      required super.releaseDate});

  factory FavoriteModel.fromDoc(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"] ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"] ?? "",
    );
  }

  Map<String, dynamic> toDoc() => {
          "id" : id,
          "title": title,
          "backdrop_path": backdropPath,
          "vote_average": voteAverage,
          "release_date": releaseDate,

      };

  factory FavoriteModel.fromMovieModel(MovieModel movie) => FavoriteModel(
      id: movie.id.toString(),
      title: movie.title,
      backdropPath: movie.backdropPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate);
}
