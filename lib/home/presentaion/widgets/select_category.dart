import 'package:fast_media/home/presentaion/widgets/category_button.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({
    super.key,
  });

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late int selectedCategory;
  List<String> categories = [
    'All',
    'Movies',
    'Series',
    'Anime',
    'Cartoon',
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: AppStyles.heading_2,
          ),
          const SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryButton(
                    btnText: categories[index],
                    isSelected: selectedCategory == index,
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
