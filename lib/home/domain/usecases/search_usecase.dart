import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/domain/entities/genres.dart';

import '../../../core/constants/api_enums.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class SearchUseCase extends BaseUseCase<List<Movie> , SearchParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  SearchUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchParameter parameters) async =>
      await baseMoviesRepository.search(parameters);
}


class SearchParameter extends Equatable {
  final Genres genres;
  final Category category;
  final String query;

  const SearchParameter({required this.genres,required this.category,required this.query});

  @override
  List<Object> get props => [genres,category,query];
}