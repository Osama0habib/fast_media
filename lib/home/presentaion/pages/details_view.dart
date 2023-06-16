import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/widgets/movie_cast.dart';
import 'package:fast_media/home/presentaion/widgets/movie_overview.dart';
import 'package:fast_media/home/presentaion/widgets/reviews_listview.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kBackgroundGrediant,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: h * 0.55,
                    width: w,
                    child: Image.network(
                      'https://sportshub.cbsistatic.com/i/2023/02/13/99bbb594-4961-4646-ba26-0613021619ed/the-flash-movie-poster-ezra-miller-barry-allen.jpg?auto=webp&width=928&height=1375&crop=0.675:1,smart',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: const [0, 0.4, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color(0xff07091A).withOpacity(0.85),
                          const Color(0xff080A1E).withOpacity(0.98),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'The Flash',
                          style: TextStyle(color: Colors.white, fontSize: 64),
                        ),
                        Text(
                          '2023| Action Fantasy | 1h 37min',
                          style: AppStyles.heading_2
                              .copyWith(color: const Color(0xffB5B5BA)),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: kWireframe_1,
                            ),
                            Icon(
                              Icons.share_rounded,
                              color: kWireframe_1,
                            ),
                            Icon(
                              Icons.file_download_outlined,
                              color: kWireframe_1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 58.0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    child: Icon(
                      Icons.play_circle,
                      color: kSeconderyColor,
                      size: w * 0.2,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              const MovieOverview(),
              const SizedBox(
                height: 22.0,
              ),
              const MovieCast(),
              const SizedBox(
                height: 22.0,
              ),
              const ReviewsListView(),
              const SizedBox(
                height: 22.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
