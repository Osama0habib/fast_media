import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/core/constants/api_enums.dart';
import 'package:fast_media/home/presentaion/bloc/search_bloc.dart';
import 'package:fast_media/home/presentaion/widgets/select_category.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/genres_constants.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/entities/genres.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kBackgroundGrediant),
      child: BlocProvider<SearchBloc>(
        create: (context) => sl<SearchBloc>(),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: (String? value) {
                                if (value != null) {
                                  context.read<SearchBloc>().add(OnSearchEvent(
                                      genres: genres[0],
                                      category: Category.movie,
                                      query: value));
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  hintText: "Search",
                                  alignLabelWithHint: true,
                                  hintStyle: const TextStyle(fontSize: 14),
                                  filled: true,
                                  fillColor: kWireframe_4,
                                  prefixIconColor: kWireframe_3,
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: const Icon(Icons.mic),
                                  suffixIconColor: kWireframe_3,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? check) {}),
                        DropdownButton<String>(
                          iconEnabledColor: kSeconderyColor,
                          underline: const SizedBox.shrink(),
                          dropdownColor: kSeconderyColor,
                          style: const TextStyle(color: Colors.white),
                          hint: const Text("Movie",
                              style: TextStyle(color: Colors.white)),
                          items: Category.values.map((Category value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        const Spacer(),
                        const Text("Sort by ",
                            style: TextStyle(color: kSeconderyColor)),
                        DropdownButton<Genres>(
                          iconEnabledColor: kSeconderyColor,
                          underline: const SizedBox.shrink(),
                          dropdownColor: kSeconderyColor,
                          style: const TextStyle(color: Colors.white),
                          hint: const Text("Horror"),
                          items: genres.map((Genres value) {
                            return DropdownMenuItem<Genres>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        const Text("Find 20 result for you  ",
                            style:
                                TextStyle(fontSize: 20, color: kWireframe_2)),
                        DropdownButton<String>(
                          iconEnabledColor: kSeconderyColor,
                          underline: const SizedBox.shrink(),
                          dropdownColor: kSeconderyColor,
                          style: const TextStyle(color: Colors.white),
                          hint: const Text("View All",
                              style: TextStyle(color: kSeconderyColor)),
                          items: Category.values.map((Category value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 12.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.27,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(33.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        ApiConstant.imageUrl(path: state.searchResult[index].backdropPath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  state.searchResult[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyles.heading_3
                                      .copyWith(color: kWireframe_1),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: state.searchResult.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
