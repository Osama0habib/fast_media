import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constants/api_enums.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {

  VideoPlayerBloc() : super(const VideoPlayerState()) {
    on<VideoPlayerInitEvent>(_initializeVideoPlayerController);

    on<EnterFullScreen>(_enterFullScreen);
  }

  FutureOr<void> _initializeVideoPlayerController(VideoPlayerInitEvent event, Emitter<VideoPlayerState> emit) {
   final youtubePlayerController = YoutubePlayerController(initialVideoId: event.videoId,flags: const YoutubePlayerFlags(autoPlay: false,mute: false,showLiveFullscreenButton: false,useHybridComposition: true));

   emit(state.copyWith(youtubePlayerController: youtubePlayerController,videoInitilaizeState: RequestState.loaded));

  }

  FutureOr<void> _enterFullScreen(EnterFullScreen event, Emitter<VideoPlayerState> emit) {
    // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // state.youtubePlayerController?.seekTo(duration!);
    Future.delayed(const Duration(seconds: 1), () {
      state.youtubePlayerController?.play();
    });

    state.youtubePlayerController?.play();
  }
}
