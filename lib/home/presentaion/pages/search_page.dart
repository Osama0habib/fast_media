import 'dart:js_util';

import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_enums.dart';
import 'package:fast_media/home/presentaion/bloc/search_bloc.dart';
import 'package:fast_media/home/presentaion/widgets/select_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/genres_constants.dart';
import '../../../core/services/service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: kBackgroundGrediant),
        child: BlocProvider<SearchBloc>(
          create: (context) => sl<SearchBloc>(),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: SizedBox(
                              height: 46,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                onChanged: (String? value) {
                                  if(value != null) {
                                    context.read<SearchBloc>().add(
                                        OnSearchEvent(genres: genres[0],
                                            category: Category.all,
                                            query: value));
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10),
                                    hintText: "Search",
                                    alignLabelWithHint: true,
                                    hintStyle: TextStyle(fontSize: 14),
                                    filled: true,
                                    fillColor: kWireframe_4,
                                    prefixIconColor: kWireframe_3,
                                    prefixIcon: Icon(Icons.search),
                                    suffixIcon: Icon(Icons.mic),
                                    suffixIconColor: kWireframe_3,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_vintage_rounded,
                                size: 24,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SelectCategory(),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? check) {}),
                      DropdownButton<String>(
                        iconEnabledColor: kSeconderyColor,
                        underline: SizedBox(),
                        dropdownColor: kSeconderyColor,
                        style: const TextStyle(color: Colors.white),
                        hint: const Text("Movie",
                            style: TextStyle(color: Colors.white)),
                        items: <String>[
                          'Movie',
                          'Series',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                      Spacer(),
                      Text(
                          "Sort by ", style: TextStyle(color: kSeconderyColor)),
                      DropdownButton<String>(
                        iconEnabledColor: kSeconderyColor,
                        underline: SizedBox(),
                        dropdownColor: kSeconderyColor,
                        style: const TextStyle(color: Colors.white),
                        hint: const Text("Horror"),
                        items: <String>[
                          'Movie',
                          'Series',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        const Text("Find 20 result for you  ",
                            style: TextStyle(
                                fontSize: 20, color: kWireframe_2)),
                        DropdownButton<String>(
                          iconEnabledColor: kSeconderyColor,
                          underline: SizedBox(),
                          dropdownColor: kSeconderyColor,
                          style: const TextStyle(color: Colors.white),
                          hint: const Text("View All",
                              style: TextStyle(color: kSeconderyColor)),
                          items: <String>[
                            'Movie',
                            'Series',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        childAspectRatio: 3 / 4,
                        mainAxisSpacing: 5),
                    itemBuilder: (BuildContext context, int index) {},
                    itemCount: 20,

                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
