import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:fast_media/home/domain/entities/movie_details.dart';
import 'package:fast_media/home/domain/usecases/remove_from_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import '../../../core/constants/api_enums.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/reviews.dart';
import '../../domain/usecases/add_to_favorite.dart';
import '../../domain/usecases/get_cast_usecase.dart';
import '../../domain/usecases/get_favorite_useCase.dart';
import '../../domain/usecases/get_reviews_usecase.dart';
import '../../domain/usecases/get_video_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetCastUseCase getCastUseCase;
  final GetReviewsUseCase getReviewsUseCase;
  final GetVideoUseCase getVideoUseCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final RemoveFromFavoriteUseCase removeFromFavoriteUseCase;
  final GetFavoriteUseCase getFavoriteUseCase;

  MovieDetailsBloc(
      this.getCastUseCase,
      this.getReviewsUseCase,
      this.getVideoUseCase,
      this.addToFavoriteUseCase,
      this.removeFromFavoriteUseCase,
      this.getFavoriteUseCase)
      : super(const MovieDetailsState()) {
    on<GetCastEvent>(_getCast);
    on<GetReviewsEvent>(_getReviews);
    on<GetVideoEvent>(_getVideo);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<RemoveFromFavoriteEvent>(_removeFromFavorite);
    on<GetUserFavoriteEvent>(_getFavorite);
  }

  Future<FutureOr<void>> _getCast(
      GetCastEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getCastUseCase(
        CastParameter(movieId: event.movieId, category: Category.movie));
    result.fold(
        (l) => emit(state.copyWith(
            castState: RequestState.error, castErrorMsg: l.message)),
        (r) => emit(state.copyWith(castState: RequestState.loaded, cast: r)));
  }

  Future<FutureOr<void>> _getReviews(
      GetReviewsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getReviewsUseCase(
        ReviewsParameter(movieId: event.movieId, category: Category.movie));
    result.fold(
        (l) => emit(state.copyWith(
            reviewsState: RequestState.error, reviewsErrorMsg: l.message)),
        (r) => emit(
            state.copyWith(reviewsState: RequestState.loaded, reviews: r)));
  }

  Future<FutureOr<void>> _getVideo(
      GetVideoEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getVideoUseCase(
        VideoParameter(movieId: event.movieId, category: Category.movie));
    result.fold(
        (l) => emit(state.copyWith(
            videoState: RequestState.error, videoErrorMsg: l.message)),
        (r) =>
            emit(state.copyWith(videoState: RequestState.loaded, videoId: r)));
  }

  Future<FutureOr<void>> _addToFavorite(
      AddToFavoriteEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(addToFavoriteState: RequestState.loading));
    final result = await addToFavoriteUseCase(
        AddToFavoriteParameter(movieId: event.movieId, movie: event.movie));
    result.fold(
        (l) => emit(state.copyWith(
            addToFavoriteState: RequestState.error,
            addToFavoriteError: l.message)), (r) {

      add(const GetUserFavoriteEvent());
    });
  }

  Future<FutureOr<void>> _removeFromFavorite(
      RemoveFromFavoriteEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(addToFavoriteState: RequestState.loading));
    final result = await removeFromFavoriteUseCase(
        RemoveFromFavoriteParameter(movieId: event.movieId));
    result.fold(
        (l) => emit(state.copyWith(
            addToFavoriteState: RequestState.error,
            addToFavoriteError: l.message)), (r) {
      // emit(state.copyWith(
      //   addToFavoriteState: RequestState.loaded,
      // ));
      add(const GetUserFavoriteEvent());
    });
  }

  Future<FutureOr<void>> _getFavorite(
      event, Emitter<MovieDetailsState> emit) async {
    final result = await getFavoriteUseCase(const NoParameter());

    result.fold((l) => null, (r) {
      UserModel.userModel?.favorite = r;
      emit(state.copyWith(
        addToFavoriteState: RequestState.loaded,
      ));
    });
  }
}
