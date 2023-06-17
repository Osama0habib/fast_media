import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/home/domain/entities/movie.dart';
import 'package:fast_media/home/presentaion/widgets/movie_actions_row.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsSliverAppBar extends StatelessWidget {
  const MovieDetailsSliverAppBar({
    super.key,
    required this.movie,
  });
  final Movie movie;
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
      flexibleSpace: FlexibleSpaceBar(
        background: FlexibleSpaceBarBackground(
          movie: movie,
        ),
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
  const FlexibleSpaceBarBackground({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        //background (the movie poster)
        CachedNetworkImage(
          imageUrl: ApiConstant.imageUrl(path: movie.backdropPath),
          progressIndicatorBuilder: (context, url, progress) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          width: w,
          height: h,
        ),

        Positioned(
          bottom: 0,
          child: Container(
            width: w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 0.8, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xff06081B).withOpacity(0.95),
                  const Color(0xff06081B).withOpacity(0.65),
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      movie.title,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    ),
                  ),

                  // date| genre | time
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${movie.releaseDate}| Action Fantasy | 1h 37min',
                      style: AppStyles.heading_2.copyWith(
                        color: const Color(0xffB5B5BA),
                      ),
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
                    onPressed: () {},
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
        ),
      ],
    );
  }
}
