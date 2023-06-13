
import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(backdropPath: json["backdrop_path"] ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg", id: json["id"]);
}
