import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class ComingSoonListView extends StatelessWidget {
  const ComingSoonListView({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: AspectRatio(
                    aspectRatio: 4 / 2,
                    child: Stack(
                      children: [
                        // the movie poster
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://sportshub.cbsistatic.com/i/2023/02/13/99bbb594-4961-4646-ba26-0613021619ed/the-flash-movie-poster-ezra-miller-barry-allen.jpg?auto=webp&width=928&height=1375&crop=0.675:1,smart',
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
                                    'The Flash;lksdjf;alksdjfa;lskdfja;sldkfj',
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
