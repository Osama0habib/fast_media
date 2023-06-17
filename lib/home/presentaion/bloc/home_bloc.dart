import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';
import 'package:fast_media/home/data/models/movie_model.dart';
import 'package:fast_media/home/domain/usecases/base_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/api_enums.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../domain/usecases/get_trending_movies_usecase.dart';
import '../../domain/usecases/get_up_coming_movies_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  HomeBloc(this.getUpComingMoviesUseCase, this.getTrendingMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const HomeState()) {
    on<GetHomeMoviesEvent>(_getHomeMovies);
    on<GetUpComingMoviesEvent>(_getUpComingMovies);
    on<GetTrendingMoviesEvent>(_getTrendingMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<AddToFavoriteEvent>(_addToFavorite);
  }

  FutureOr<void> _getTrendingMovies(
      GetTrendingMoviesEvent event, Emitter<HomeState> emit) async {
    print("getTrending");

    final result = await getTrendingMoviesUseCase(
        const TrendingMoviesPageParameter(page: 0));
    result.fold(
        (l) => emit(state.copyWith(
            trendingMoviesRequestState: RequestState.error,
            trendingMoviesError: l.message)),
        (r) => emit(state.copyWith(
            trendingMoviesRequestState: RequestState.loaded,
            trendingMovies: r)));
  }

  Future<FutureOr<void>> _getUpComingMovies(
      GetUpComingMoviesEvent event, Emitter<HomeState> emit) async {
    print("getUpComing");
    final result = await getUpComingMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            upComingRequestState: RequestState.error,
            upComingError: l.message)),
        (r) => emit(state.copyWith(
            upComingRequestState: RequestState.loaded, upComingMovies: r)));
  }

  Future<FutureOr<void>> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<HomeState> emit) async {
    print("getTopRated");
    final result = await getTopRatedMoviesUseCase(
        const TopRatedMoviesPageParameter(page: 0));
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesRequestState: RequestState.error,
            topRatedMoviesError: l.message)),
        (r) => emit(state.copyWith(
            topRatedMoviesRequestState: RequestState.loaded,
            topRatedMovies: r)));
  }

  FutureOr<void> _getHomeMovies(
      GetHomeMoviesEvent event, Emitter<HomeState> emit) {
    add(const GetUpComingMoviesEvent());
    add(const GetTrendingMoviesEvent());
    add(const GetTopRatedMoviesEvent());
  }

  Future<FutureOr<void>> _addToFavorite(
      AddToFavoriteEvent event, Emitter<HomeState> emit) async {
    final result = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("favorite")
        .add(FavoriteModel.fromMovieModel(event.movie).toDoc());
  }
}
