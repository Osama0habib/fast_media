import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/widgets/coming_soon.dart';
import 'package:fast_media/home/presentaion/widgets/recommended_listview.dart';
import 'package:fast_media/home/presentaion/widgets/trending_listview.dart';
import 'package:fast_media/home/presentaion/widgets/home_appbar.dart';
import 'package:fast_media/home/presentaion/widgets/select_category.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kBackgroundGrediant,
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22.0,
                      ),
                      SelectCategory(),
                      SizedBox(
                        height: 32,
                      ),
                      ComingSoonListView(),
                      SizedBox(
                        height: 36,
                      ),
                      TrendingListView(),
                      SizedBox(
                        height: 36,
                      ),
                      RecommendedListView(),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
