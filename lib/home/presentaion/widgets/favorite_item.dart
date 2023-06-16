import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../authentication/presentation/widgets/default_button.dart';
import '../../../colors/colors.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Container(
        height: 135,
        decoration: BoxDecoration(
            color: kWireframe_4, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                    width: 108,
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-movie-poster-template-design-0f5fff6262fdefb855e3a9a3f0fdd361_screen.jpg?ts=1636996054"),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Freedom", style: AppStyles.heading_2),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingBar(
                          ratingWidget: RatingWidget(
                              empty: const Icon(Icons.star_outlined),
                              full: const Icon(Icons.star),
                              half: const Icon(Icons.star_half)),
                          onRatingUpdate: (double rating) {},
                          itemSize: 13.96),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8.9",
                        style:
                            AppStyles.inActive12.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "2019 |3h 17 min",
                    style: AppStyles.inActive14.copyWith(color: kWireframe_3),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 120,
                    height: 32,
                    child: DefaultButton(
                      btnText: 'Watch Now',
                      onPressed: () {},
                      style: AppStyles.medium_10.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 43,
                height: 43,
                child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: kWireframe_4,
                    child: SvgPicture.asset("assets/icons/bag.svg",height: 18,width: 18,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
