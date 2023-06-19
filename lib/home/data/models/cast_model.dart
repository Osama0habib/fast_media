import '../../domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel(
      {required super.adult,
      required super.gender,
      required super.id,
      required super.knownForDepartment,
      required super.name,
      required super.originalName,
      required super.popularity,
      required super.profilePath,
      required super.castId,
      required super.character,
      required super.creditId,
      required super.order});

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"],
      profilePath: json["profile_path"],
      castId: json["cast_id"],
      character: json["character"],
      creditId: json["credit_id"],
      order: json["order"]);
}
