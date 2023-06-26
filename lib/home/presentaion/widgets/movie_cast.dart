import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/home/domain/entities/cast.dart';
import 'package:fast_media/home/presentaion/bloc/movie_details_bloc.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/api_enums.dart';

class MovieCast extends StatefulWidget {
  const MovieCast({super.key});

  @override
  State<MovieCast> createState() => _MovieCastState();
}

class _MovieCastState extends State<MovieCast> {
  bool isExpanded = false;
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
                    itemCount: isExpanded ? state.cast.length : 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CastListviewItem(
                        cast: state.cast[index],
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            isExpanded ? 'Show Less' : 'Show More',
                            style: AppStyles.heading_3
                                .copyWith(color: kSeconderyColor),
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: kSeconderyColor,
                        )
                      ],
                    ),
                  ),
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

class CastListviewItem extends StatelessWidget {
  const CastListviewItem({
    super.key,
    required this.cast,
  });
  final Cast cast;
  @override
  Widget build(BuildContext context) {
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
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(
                Icons.person,
                size: 28,
              ),
              imageUrl: ApiConstant.imageUrl(path: cast.profilePath),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: constraints.maxWidth * 0.15,
                backgroundImage: imageProvider,
              ),
            ),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.05,
          ),
          SizedBox(
            width: constraints.maxWidth * 0.5,
            child: Text(
              cast.name,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.cardButton.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
