import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/domain/entities/movie.dart';
import 'package:fast_media/home/presentaion/widgets/movie_details_body.dart';
import 'package:fast_media/home/presentaion/widgets/movie_details_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/api_enums.dart';
import '../../../core/services/service_locator.dart';
import '../bloc/movie_details_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetCastEvent(movieId: movie.id, category: Category.movie))
        ..add(GetReviewsEvent(movieId: movie.id, category: Category.movie))
        ..add(GetVideoEvent(movieId: movie.id, category: Category.movie)),
      child: Scaffold(
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
      ),
    );
  }
}
