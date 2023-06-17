import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/home/domain/entities/movie.dart';
import 'package:fast_media/home/presentaion/pages/details_view.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({
    super.key,
    required this.movie,
    required this.index,
  });

  final Movie movie;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsView(
                movie: movie,
              ),
            ),
          );
        },
        child: Column(
          children: [
            // movie image
            Expanded(
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstant.imageUrl(
                        path: movie.posterPath, quality: 'w500'),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 8.0,
            ),

            //title
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyles.heading_3.copyWith(
                  color: index % 2 == 0 ? kWireframe_1 : Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
