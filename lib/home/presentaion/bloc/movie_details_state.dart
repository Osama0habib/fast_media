part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final String videoId;
  final RequestState videoState;
  final String videoErrorMsg;
  final List<Cast> cast;
  final List<Reviews> reviews;
  final RequestState castState;
  final String castErrorMsg;
  final RequestState reviewsState;
  final String reviewsErrorMsg;
  final RequestState addToFavoriteState;
  final String addToFavoriteError;

  const MovieDetailsState(
      {this.videoState = RequestState.loading,
      this.videoErrorMsg = "",
      this.videoId = "",
      this.cast = const [],
      this.reviews = const [],
      this.castState = RequestState.loading,
      this.castErrorMsg = "",
      this.reviewsState = RequestState.loading,
      this.reviewsErrorMsg = "",
        this.addToFavoriteError = "",
        this.addToFavoriteState = RequestState.initial});

  MovieDetailsState copyWith({
    String? videoId,
    RequestState? videoState,
    String? videoErrorMsg,
    List<Cast>? cast,
    List<Reviews>? reviews,
    RequestState? castState,
    String? castErrorMsg,
    RequestState? reviewsState,
    String? reviewsErrorMsg,
    RequestState? addToFavoriteState,
    String? addToFavoriteError
  }) =>
      MovieDetailsState(
          videoState: videoState ?? this.videoState,
          videoErrorMsg: videoErrorMsg ?? this.videoErrorMsg,
          videoId: videoId ?? this.videoId,
          cast: cast ?? this.cast,
          reviews: reviews ?? this.reviews,
          castState: castState ?? this.castState,
          reviewsState: reviewsState ?? this.reviewsState,
          castErrorMsg: castErrorMsg ?? this.castErrorMsg,
          addToFavoriteState: addToFavoriteState ?? this.addToFavoriteState,
          addToFavoriteError: addToFavoriteError ?? this.addToFavoriteError,
          reviewsErrorMsg: reviewsErrorMsg ?? this.reviewsErrorMsg);

  @override
  List<Object> get props => [
        videoErrorMsg,
        videoState,
        videoId,
        cast,
        reviews,
        castState,
        castErrorMsg,
        reviewsState,
        reviewsErrorMsg,
    addToFavoriteState,
    addToFavoriteError,
      ];
}
