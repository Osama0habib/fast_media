import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.isFavorite,
    required super.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"] ?? json['name'] ?? '',
      backdropPath: json["backdrop_path"] ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
      posterPath: json['poster_path'] ?? '/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"] ?? "",
      isFavorite: false,
    );
  }
}
