import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/pages/details_view.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.movieTitle,
  });
  final int index;
  final String imageUrl;
  final String movieTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DetailsView(),
            ),
          );
        },
        child: Column(
          children: [
            // movie image
            Expanded(
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl,
                      ),
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
                movieTitle,
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
