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
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff06081B),
              Color(0xff4B3675),
            ],
            stops: [1, 1.0]
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Favorite",style: AppStyles.heading_1.copyWith(color: Colors.white),),
          ),
          Text("Here you will find the movies that you liked",style: AppStyles.inActive12.copyWith(color: Colors.grey),),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
             return const FavoriteItem();
            },),
          )
        ],),
      ),
    );
  }
}
