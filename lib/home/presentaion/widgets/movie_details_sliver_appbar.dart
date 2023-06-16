import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/widgets/movie_actions_row.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsSliverAppBar extends StatelessWidget {
  const MovieDetailsSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SliverAppBar(
      actions: const [
        Icon(
          Icons.favorite,
          color: kSeconderyColor,
        ),
        SizedBox(
          width: 24.0,
        ),
      ],
      expandedHeight: h * 0.55,
      floating: true,
      pinned: true,
      backgroundColor: kPrimaryColor,
      flexibleSpace: const FlexibleSpaceBar(
        background: FlexibleSpaceBarBackground(),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FlexibleSpaceBarBackground extends StatelessWidget {
  const FlexibleSpaceBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        //background (the movie poster)
        Image.network(
          'https://sportshub.cbsistatic.com/i/2023/02/13/99bbb594-4961-4646-ba26-0613021619ed/the-flash-movie-poster-ezra-miller-barry-allen.jpg?auto=webp&width=928&height=1375&crop=0.675:1,smart',
          fit: BoxFit.cover,
          width: w,
        ),

        Positioned(
          bottom: 0,
          child: Container(
            width: w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 0.7, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xff06081B).withOpacity(0.95),
                  const Color(0xff06081B).withOpacity(0.65),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //title
                const Text(
                  'The Flash',
                  style: TextStyle(color: Colors.white, fontSize: 64),
                ),

                // date| genre | time
                Text(
                  '2023| Action Fantasy | 1h 37min',
                  style: AppStyles.heading_2.copyWith(
                    color: const Color(0xffB5B5BA),
                  ),
                ),

                const SizedBox(
                  height: 24.0,
                ),

                // Movie Actions (Save, Share, Download)
                const MovieActionsRow(),

                const SizedBox(
                  height: 18.0,
                ),

                //play button
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print('play button');
                  },
                  icon: Icon(
                    Icons.play_circle,
                    color: kSeconderyColor,
                    size: w * 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
