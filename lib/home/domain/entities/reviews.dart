import 'package:equatable/equatable.dart';

import '../../data/models/author_details_model.dart';

class Reviews extends Equatable {
  final String author;
  final AuthorDetailsModel? authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  const Reviews(
      {required this.author,
      this.authorDetails,
      required this.content,
      required this.createdAt,
      required this.id,
      required this.updatedAt,
      required this.url});

  @override
  List<Object?> get props => [
        author,
        authorDetails,
        content,
        createdAt,
        id,
        updatedAt,
        url,
      ];
}
