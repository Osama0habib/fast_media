import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/bloc/video_player_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoControls extends StatelessWidget {
  const VideoControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AnimationController controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 200),
    // );
    //
    // Animation<double> animation = CurvedAnimation(
    //     curve: Curves.linear,
    //     parent: controller
    // );

    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kBlack,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            // AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animation),
            IconButton(
                onPressed: () {
                  if(state.isPlaying) {

                    state.youtubePlayerController?.pause();
                  }else{
                    state.youtubePlayerController?.play();
                  }
                },
                icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow,size: 18,)),
            Expanded(
              child: ProgressBar(
                progress: state.progress,
                // buffered: state.youtubePlayerController.,
                total: state.youtubePlayerController!.metadata.duration,
                progressBarColor: Colors.red,
                baseBarColor: Colors.white.withOpacity(0.24),
                bufferedBarColor: Colors.white.withOpacity(0.24),
                thumbColor: Colors.white,
                barHeight: 3.0,
                thumbRadius: 5.0,
                // timeLabelType: TimeLabelType.,
                timeLabelLocation: TimeLabelLocation.none,

                onSeek: (duration) {
                  state.youtubePlayerController?.seekTo(duration);
                },
                thumbGlowRadius: 10,
                // barCapShape: BarCapShape.round,
                // thumbCanPaintOutsideBar: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("${state.progress.inSeconds}/${state.youtubePlayerController?.metadata.duration.inSeconds}"),
            ),
            SizedBox(
              height: 32.0,
              width: 32.0,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_up_rounded,size: 16,),),
            ),
            SizedBox(
              height: 32.0,
              width: 32.0,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.closed_caption,size: 16,)),
            ),
            SizedBox(
              height: 32.0,
              width: 32.0,
              child: IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.settings,size: 16,)),
            ),
            SizedBox(
              height: 32.0,
              width: 32.0,
              child: IconButton(
                  onPressed: () {
                    state.youtubePlayerController?.toggleFullScreenMode();
                  },
                  icon: const Icon(Icons.fullscreen,size: 16,)),
            ),
          ]),
        ),
      );
    });
  }
}
