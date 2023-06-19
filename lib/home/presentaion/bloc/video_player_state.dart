part of 'video_player_bloc.dart';

class VideoPlayerState extends Equatable {
  final YoutubePlayerController? youtubePlayerController;

  final bool isPlaying;
  final RequestState videoInitilaizeState;
  final Duration progress ;

  const VideoPlayerState(
      {this.youtubePlayerController,
        this.progress = Duration.zero,
      this.videoInitilaizeState = RequestState.loading,
      this.isPlaying = false});

  VideoPlayerState copyWith(
          {YoutubePlayerController? youtubePlayerController,
          RequestState? videoInitilaizeState,
          Duration? progress,
          bool? isPlaying}) =>
      VideoPlayerState(
          youtubePlayerController:
              youtubePlayerController ?? this.youtubePlayerController,
          videoInitilaizeState:
              videoInitilaizeState ?? this.videoInitilaizeState,
          isPlaying: isPlaying ?? this.isPlaying,
          progress: progress ?? this.progress,
      );

  @override
  List<Object?> get props => [youtubePlayerController,videoInitilaizeState,isPlaying];
}
