import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/api_enums.dart';
import '../../data/models/cast_model.dart';
import '../../data/models/reviews_model.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/reviews.dart';
import '../../domain/usecases/get_cast_usecase.dart';
import '../../domain/usecases/get_reviews_usecase.dart';
import '../../domain/usecases/get_video_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetCastUseCase getCastUseCase;
  final GetReviewsUseCase getReviewsUseCase;
  final GetVideoUseCase getVideoUseCase;
  MovieDetailsBloc(this.getCastUseCase, this.getReviewsUseCase, this.getVideoUseCase) : super(const MovieDetailsState()) {
   on<GetCastEvent>(_getCast);
   on<GetReviewsEvent>(_getReviews);
   on<GetVideoEvent>(_getVideo);
  }

  Future<FutureOr<void>> _getCast(GetCastEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getCastUseCase(
         CastParameter(movieId: event.movieId,category: Category.movie));
    result.fold(
            (l) => emit(state.copyWith(
            castState: RequestState.error,
            castErrorMsg: l.message)),
            (r) => emit(state.copyWith(
            castState: RequestState.loaded,
            cast: r)));
  }

  Future<FutureOr<void>> _getReviews(GetReviewsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getReviewsUseCase(
        ReviewsParameter(movieId: event.movieId,category: Category.movie));
    result.fold(
            (l) => emit(state.copyWith(
            reviewsState: RequestState.error,
            reviewsErrorMsg: l.message)),
            (r) => emit(state.copyWith(
            reviewsState: RequestState.loaded,
            reviews: r)));
  }

  Future<FutureOr<void>> _getVideo(GetVideoEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getVideoUseCase(
        VideoParameter(movieId: event.movieId,category: Category.movie));
    result.fold(
            (l) => emit(state.copyWith(
            videoState: RequestState.error,
            videoErrorMsg: l.message)),
            (r) => emit(state.copyWith(
            videoState: RequestState.loaded,
            videoId: r)));
  }
}
