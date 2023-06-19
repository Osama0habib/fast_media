import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/api_enums.dart';
import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetVideoUseCase
    extends BaseUseCase<String, VideoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetVideoUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, String>> call(
      VideoParameter parameters) async =>
      await baseMoviesRepository.getVideo(parameters);
}

class VideoParameter extends Equatable {
  final int movieId;
  final Category category;

  const VideoParameter({required this.movieId,required this.category});

  @override
  List<Object> get props => [movieId,category];
}