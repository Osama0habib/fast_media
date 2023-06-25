import 'dart:convert';

import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../core/constants/api_constants.dart';
import '../../../core/constants/api_enums.dart';
import '../bloc/movie_details_bloc.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.reviewsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case RequestState.loaded:
            debugPrint("review : ${state.reviews.first.content}");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Reviews',
                    style: AppStyles.heading_1,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 24.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.reviews.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                        color: kWireframe_4,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: NetworkImage(
                                    ApiConstant.imageUrl(
                                        path: state.reviews[index].authorDetails
                                                ?.avatarPath ??
                                            ""),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.reviews[index].authorDetails!
                                          .username,
                                      style: AppStyles.heading_3
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      timeago.format(DateTime.parse(
                                          state.reviews[index].updatedAt)),
                                      style: AppStyles.inActive14
                                          .copyWith(color: kWireframe_1),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     for (int i = 0; i < 5; i++)
                                    //       const Icon(
                                    //         Icons.star_rounded,
                                    //         color: kSeconderyColor,
                                    //         size: 14,
                                    //       )
                                    //   ],
                                    // )
                                    RatingBar(
                                        ratingWidget: RatingWidget(
                                            full:
                                                const Icon(Icons.star_rounded,color: kSeconderyColor,),
                                            half: const Icon(
                                                Icons.star_half_rounded,color: kSeconderyColor,),
                                            empty: const Icon(
                                                Icons.star_border_rounded,color: kSeconderyColor,)),
                                        onRatingUpdate: (double rate) {},
                                        itemSize: 14,

                                        allowHalfRating: true,
                                        maxRating: 10.0,
                                        minRating: 0.0,
                                        initialRating: state.reviews[index]
                                            .authorDetails!.rating),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.58,
                              child: Text(
                                "${state.reviews[index].content}",
                                style: AppStyles.inActive14.copyWith(
                                  color: Colors.white,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(state.reviewsErrorMsg),
            );
          case RequestState.initial:
            return Center(
              child: Text(state.reviewsErrorMsg),
            );
        }
      },
    );
  }
}
