import 'package:fast_media/home/presentaion/widgets/select_category.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children:  [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
            child: Row(
              children: [
                 const Expanded(child: SearchBar(trailing: [Icon(Icons.mic)],leading: Icon(Icons.search),)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.filter_vintage_rounded)),
              ],
            ),
          ),
          SelectCategory(),
        ],
      ),
    );
  }
}
