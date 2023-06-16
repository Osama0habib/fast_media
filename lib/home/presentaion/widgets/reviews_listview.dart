import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
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
                        const CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Luke Rota',
                              style: AppStyles.heading_3
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '2 Months ago',
                              style: AppStyles.inActive14
                                  .copyWith(color: kWireframe_1),
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  const Icon(
                                    Icons.star_rounded,
                                    color: kSeconderyColor,
                                    size: 14,
                                  )
                              ],
                            )
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
                        'fffffffffffffffffffffffffffff Ever since the original John Wick, the franchise has set a standard of what action in Hollywood should be. Thanks to director Chad Stahelski and Keanu Reeve\'s knowledge of the technical aspects of shooting action',
                        style: AppStyles.inActive14.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
