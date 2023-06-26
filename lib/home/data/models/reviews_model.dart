import 'package:fast_media/home/domain/entities/reviews.dart';

import 'author_details_model.dart';

class ReviewsModel extends Reviews {
  const ReviewsModel(
      {required super.author,
      required super.authorDetails,
      required super.content,
      required super.createdAt,
      required super.id,
      required super.updatedAt,
      required super.url});

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
      author: json['author'],
      authorDetails: json['author_details'] != null
          ? AuthorDetailsModel.fromJson(json['author_details'])
          : null,
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url']);
}
