
import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.videoId});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json["backdrop_path"],
          id: json["id"],
          overview: json["overview"],
          releaseDate: json["release_date"],
          runtime: json["runtime"],
          title: json["title"],
          videoId: json["videos"]["results"][0]["key"],
          voteAverage: json["vote_average"].toDouble(),
          genres:
              List.from(json["genres"].map((e) => GenresModel.fromJson(e))));
}
