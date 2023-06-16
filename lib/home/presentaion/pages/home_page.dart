import 'package:flutter/material.dart';

import '../widgets/coming_soon.dart';
import '../widgets/home_appbar.dart';
import '../widgets/recommended_listview.dart';
import '../widgets/select_category.dart';
import '../widgets/trending_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
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
    );
  }
}
