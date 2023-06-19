import '../../domain/entities/author_details.dart';

class AuthorDetailsModel extends AuthorDetails {
  const AuthorDetailsModel(
      {required super.name, required super.username, required super.avatarPath, required super.rating});


  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) =>
      AuthorDetailsModel(name: json['name'],
          username: json['username'],
          avatarPath: json['avatar_path'],
          rating: json['rating'] is double ? json['rating'] : double.parse(json['rating'].toString()));

}