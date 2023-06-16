import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: AppStyles.heading_1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 12.0,
            ),
            scrollDirection: Axis.vertical,
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LayoutBuilder(
                builder: (context, constraints) => Container(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                  decoration: BoxDecoration(
                    color: kWireframe_4,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(children: [
                    CircleAvatar(
                      radius: constraints.maxWidth * 0.15,
                      backgroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.05,
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Text(
                        'Keanu Reeves',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.cardButton.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
