part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Movie> upComingMovies;
  final RequestState upComingRequestState;
  final String upComingError;
  final List<Movie> trendingMovies;
  final RequestState trendingMoviesRequestState;
  final String trendingMoviesError;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesRequestState;
  final String topRatedMoviesError;


  HomeState copyWith({ List<Movie>? upComingMovies,
    RequestState? upComingRequestState,
    String? upComingError,
    List<Movie>? trendingMovies,
    RequestState? trendingMoviesRequestState,
    String? trendingMoviesError,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesRequestState,
    String? topRatedMoviesError,}) =>
      HomeState(upComingMovies: upComingMovies ?? this.upComingMovies,
        upComingRequestState:
        upComingRequestState ?? this.upComingRequestState,
        upComingError:
        upComingError ?? this.upComingError,
        trendingMovies: trendingMovies ?? this.trendingMovies,
        trendingMoviesRequestState:
        trendingMoviesRequestState ?? this.trendingMoviesRequestState,
        trendingMoviesError: trendingMoviesError ??
            this.trendingMoviesError,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMoviesRequestState:
        topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
        topRatedMoviesError:
        topRatedMoviesError ?? this.topRatedMoviesError,

      );

  const HomeState({this.upComingMovies = const [],
    this.upComingRequestState = RequestState.loading,
    this.upComingError = "",
    this.trendingMovies = const [],
    this.trendingMoviesRequestState = RequestState.loading,
    this.trendingMoviesError = "",
    this.topRatedMovies = const [],
    this.topRatedMoviesRequestState = RequestState.loading,
    this.topRatedMoviesError = ""});

// final RequestState loadMoreRequestState;

  @override
  List<Object> get props =>
      [
        upComingMovies,
        upComingRequestState,
        upComingError,
        trendingMovies,
        trendingMoviesRequestState,
        trendingMoviesError,
        topRatedMovies,
        topRatedMoviesRequestState,
        topRatedMoviesError,
      ];
}
