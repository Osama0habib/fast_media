import 'package:fast_media/authentication/data/models/user_model.dart';

import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
   MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
     super.isFavorite,
    required super.posterPath,
    required super.mediaType,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    // print(UserModel.userModel!.favorite);
    return MovieModel(
      id: json["id"],
      title: json["title"] ?? json['name'] ?? '',
      mediaType: json['media_type'] ?? 'movie',
      backdropPath: json["backdrop_path"] ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
      posterPath: json['poster_path'] ?? '/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"] ?? "",
      isFavorite:false,
    );
  }

}
