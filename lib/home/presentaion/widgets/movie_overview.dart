import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    super.key,
    required this.movieOverView,
  });
  final String movieOverView;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: AppStyles.heading_1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          ReadMoreText(
            movieOverView,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            moreStyle: AppStyles.heading_3.copyWith(color: Colors.white),
            lessStyle: AppStyles.heading_3.copyWith(color: Colors.white),
            style: AppStyles.heading_3.copyWith(color: kWireframe_3),
          ),
        ],
      ),
    );
  }
}
