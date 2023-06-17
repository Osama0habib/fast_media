import 'dart:math';

import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/core/constants/api_enums.dart';
import 'package:fast_media/home/presentaion/bloc/home_bloc.dart';
import 'package:fast_media/home/presentaion/widgets/movie_listview_item.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingListView extends StatelessWidget {
  const TrendingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.trendingMoviesRequestState == RequestState.loading ||
            current.trendingMoviesRequestState == RequestState.loaded ||
            current.trendingMoviesError.isNotEmpty;
      },
      builder: (context, state) {
        switch (state.trendingMoviesRequestState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );

          case RequestState.error:
            return Center(
              child: Text(state.trendingMoviesError),
            );

          case RequestState.loaded:
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 24.0,
                    ),
                    Text(
                      'Trending',
                      style: AppStyles.heading_2,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All  >',
                        style: AppStyles.inActive14
                            .copyWith(color: kSeconderyColor),
                      ),
                    ),
                    const SizedBox(
                      width: 24.0,
                    )
                  ],
                ),

                const SizedBox(
                  height: 16.0,
                ),

                // trending listView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 24.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendingMovies.length,
                    itemBuilder: (context, index) {
                      return MovieListViewItem(
                        index: index,
                        movie: state.trendingMovies[index],
                      );
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
