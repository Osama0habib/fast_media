import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/constants/api_constants.dart';
import 'package:fast_media/core/constants/api_enums.dart';
import 'package:fast_media/home/presentaion/bloc/home_bloc.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ComingSoonListView extends StatefulWidget {
  const ComingSoonListView({super.key});

  @override
  State<ComingSoonListView> createState() => _ComingSoonListViewState();
}

class _ComingSoonListViewState extends State<ComingSoonListView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.75);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (HomeState previous, HomeState current) {
       return previous.upComingRequestState == RequestState.loading || current.upComingRequestState == RequestState.loaded || current.upComingError.isNotEmpty;
      },
  builder: (context, state) {

        switch(state.upComingRequestState){

          case RequestState.loading:
            return const Center(child: CircularProgressIndicator.adaptive(),);
          case RequestState.loaded:
            print("lenght : ${state.upComingMovies.length}");
            return Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Coming Soon',
                        style: AppStyles.heading_2,
                      ),
                      const Spacer(),

                      //view all button
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'View All  >',
                          style: AppStyles.inActive14.copyWith(color: kSeconderyColor),
                        ),
                      ),

                      const SizedBox(
                        width: 24.0,
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),

                  // list view builder
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.155,
                    child: PageView.builder(
                      padEnds: false,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.upComingMovies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Stack(
                            children: [
                              // the movie poster
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      ApiConstant.imageUrl(state.upComingMovies[index].backdropPath),
                                    ),
                                  ),
                                ),
                              ),

                              // play icon
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Icon(
                                      Icons.play_circle,
                                      color: kSeconderyColor,
                                      size: constraints.maxHeight * 0.4,
                                    );
                                  },
                                ),
                              ),

                              //name
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.07,
                                        bottom: constraints.maxHeight * 0.07,
                                      ),
                                      child: SizedBox(
                                        width: constraints.maxWidth * 0.5,
                                        child: Text(
                                          state.upComingMovies[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: constraints.maxWidth * 0.065,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //rating
                              Align(
                                alignment: Alignment.bottomRight,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Padding(
                                    padding: EdgeInsets.only(
                                      right: constraints.maxWidth * 0.07,
                                      bottom: constraints.maxHeight * 0.07,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: kSeconderyColor,
                                          size: constraints.maxHeight * 0.15,
                                        ),
                                        Text(
                                          '8.8',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: constraints.maxHeight * 0.13,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 24.0,
                  ),

                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: kSeconderyColor,
                      spacing: 4.0,
                      dotWidth: 8,
                      dotHeight: 8,
                    ),
                  ),
                ],
              ),
            );
          case RequestState.error:
           return Center(child: Text(state.upComingError),);
        }
  },
);
  }
}
