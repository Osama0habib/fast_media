import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../colors/colors.dart';
import '../../../core/constants/api_enums.dart';
import '../bloc/video_player_bloc.dart';
import '../widgets/video_controls.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key, required this.videoId}) : super(key: key);
  final String videoId;

  // final List<Recommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoPlayerBloc()..add(VideoPlayerInitEvent(videoId)),
      child: Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        body: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
          builder: (context, state) {
            switch (state.videoInitilaizeState) {
              case RequestState.loading:
                return const Center(
                  child: Text("error Loading Video"),
                );
              case RequestState.loaded:
                return YoutubePlayerBuilder(
                    onExitFullScreen: () {
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.portraitUp]);
                    },
                    player: YoutubePlayer(
                      controller: state.youtubePlayerController!,
                      // showVideoProgressIndicator: true,
                      // progressIndicatorColor: Colors.blueAccent,
                      bottomActions: null,
                      topActions: <Widget>[
                        const SizedBox(width: 8.0),
                        IconButton(
                            onPressed: () {
                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.portraitUp]);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        Expanded(
                          child: Text(
                            state.youtubePlayerController!.metadata.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                      // onReady: () {
                      //   state.youtubePlayerController
                      //       !.addListener(listener);
                      // },
                      onEnded: (data) {},
                    ),
                    onEnterFullScreen: () {
                      context.read<VideoPlayerBloc>().add(EnterFullScreen());
                    },
                    builder: (context, player) => Container(
                          decoration: const BoxDecoration(
                            gradient: kBackgroundGrediant,
                          ),
                          child:
                              // false ? Center(
                              //   child: Column(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [

                              //       Stack(
                              //         children: [
                              //           player,
                              //           const Align(
                              //               alignment: Alignment.bottomCenter,
                              //               child: VideoControls()),
                              //         ],
                              //       ),
                              //       // const Expanded(
                              //       //   child: Padding(
                              //       //     padding: EdgeInsets.all(8.0),
                              //       //     child: CustomScrollView(slivers: [
                              //       //       SliverPadding(
                              //       //         padding :EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                              //       //
                              //       //         // sliver: ShowRecommendation(
                              //       //         //     recommendations: recommendations),
                              //       //       )
                              //       //     ]),
                              //       //   ),
                              //       // )
                              //     ],
                              //   ),
                              // ) :
                              Stack(children: [
                            Center(
                              child: player,
                            ),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: VideoControls(),
                            )
                          ]),
                        ));
              case RequestState.error:
                return const Center(
                  child: Text("error Loading Video"),
                );
              case RequestState.initial:
                return const Center(
                  child: Text("error Loading Video"),
                );
            }
          },
        ),
      ),
    );
  }
}
