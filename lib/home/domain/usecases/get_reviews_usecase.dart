import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/domain/entities/reviews.dart';

import '../../../core/constants/api_enums.dart';
import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetReviewsUseCase extends BaseUseCase<List<Reviews>, ReviewsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetReviewsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Reviews>>> call(
          ReviewsParameter parameters) async =>
      await baseMoviesRepository.getReviews(parameters);
}

class ReviewsParameter extends Equatable {
  final int movieId;
  final Category category;

  const ReviewsParameter({required this.movieId, required this.category});

  @override
  List<Object> get props => [movieId, category];
}
