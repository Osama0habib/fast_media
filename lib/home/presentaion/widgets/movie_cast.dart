import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/home/presentaion/bloc/movie_details_bloc.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/api_enums.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.castState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cast',
                    style: AppStyles.heading_1,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 12.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: state.cast.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LayoutBuilder(
                        builder: (context, constraints) => Container(
                          padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                          decoration: BoxDecoration(
                            color: kWireframe_4,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              radius: constraints.maxWidth * 0.15,
                              backgroundImage: NetworkImage(
                                ApiConstant.imageUrl(
                                    path: state.cast[index].profilePath),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.05,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.5,
                              child: Text(
                                state.cast[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.cardButton.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  )
                ],
              ),
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
