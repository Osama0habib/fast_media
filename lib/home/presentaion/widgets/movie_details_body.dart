import 'package:fast_media/home/presentaion/widgets/movie_cast.dart';
import 'package:fast_media/home/presentaion/widgets/movie_overview.dart';
import 'package:fast_media/home/presentaion/widgets/reviews_listview.dart';
import 'package:flutter/material.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
        SizedBox(
          height: 48.0,
        ),

        // Detials
        MovieOverview(),
        SizedBox(
          height: 22.0,
        ),

        //cast listview
        MovieCast(),
        SizedBox(
          height: 22.0,
        ),

        //Reviews
        ReviewsListView(),
        SizedBox(
          height: 28.0,
        ),
      ],
    );
  }
}
