import 'package:fast_media/home/domain/entities/movie.dart';
import 'package:fast_media/home/presentaion/widgets/movie_cast.dart';
import 'package:fast_media/home/presentaion/widgets/movie_overview.dart';
import 'package:fast_media/home/presentaion/widgets/reviews_listview.dart';
import 'package:flutter/material.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48.0,
        ),

        // Detials
        MovieOverview(
          movieOverView: movie.overview,
        ),
        const SizedBox(
          height: 22.0,
        ),

        //cast listview
        const MovieCast(),
        const SizedBox(
          height: 22.0,
        ),

        //Reviews
        const ReviewsListView(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ],
    );
  }
}
