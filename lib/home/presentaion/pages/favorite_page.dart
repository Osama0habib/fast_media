import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../syles/app_styles.dart';
import '../widgets/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: kBackgroundGrediant,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Favorite",
                style: AppStyles.heading_1.copyWith(color: Colors.white),
              ),
            ),
            Text(
              "Here you will find the movies that you liked",
              style: AppStyles.inActive12.copyWith(color: Colors.grey),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: UserModel.userModel?.favorite.length,
                // shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return  FavoriteItem(favoriteModel: UserModel.userModel!.favorite[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
