import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/domain/entities/movie.dart';
import 'package:fast_media/home/presentaion/widgets/movie_details_body.dart';
import 'package:fast_media/home/presentaion/widgets/movie_details_sliver_appbar.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // appbar
          MovieDetailsSliverAppBar(
            movie: movie,
          ),

          //body
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: kBackgroundGrediant,
              ),
              child: MovieDetailsBody(
                movie: movie,
              ),
            ),
          )
        ],
      ),
    );
  }
}
