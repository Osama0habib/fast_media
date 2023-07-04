import 'package:dartz/dartz.dart';


import '../../../core/base_usercase/base_auth_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetUpComingMoviesUseCase extends BaseUseCase<List<Movie> , NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetUpComingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameters) async =>
      await baseMoviesRepository.getUpComingMovies();
}
