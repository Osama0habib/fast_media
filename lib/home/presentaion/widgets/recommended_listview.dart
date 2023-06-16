import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/widgets/movie_listview_item.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 24.0,
            ),
            Text(
              'Recommended for you',
              style: AppStyles.heading_2,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View All  >',
                style: AppStyles.inActive14.copyWith(color: kSeconderyColor),
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.24,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 24.0),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return MovieListViewItem(
                  index: index,
                  imageUrl:
                      'https://sportshub.cbsistatic.com/i/2023/02/13/99bbb594-4961-4646-ba26-0613021619ed/the-flash-movie-poster-ezra-miller-barry-allen.jpg?auto=webp&width=928&height=1375&crop=0.675:1,smart',
                  movieTitle: 'The Flash');
            },
          ),
        ),
      ],
    );
  }
}
