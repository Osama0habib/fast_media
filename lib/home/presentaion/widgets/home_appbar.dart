import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthenticationBloc>().currentUser;

    return Padding(
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, top: 12.0, bottom: 8.0),
      child: Row(
        children: [
           CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                currentUser?.imageUrl ?? 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,Mr ${currentUser?.displayName ?? currentUser?.email?.split("@").first}',
                  style: AppStyles.heading_1,

                  maxLines: 2,
                ),
                Text(
                  'Enjoy your favourite Movie',
                  style: AppStyles.cardButton.copyWith(color: kWireframe_1),
                ),
              ],
            ),
          ),
          // const Spacer(),
          SvgPicture.asset(
            'assets/images/notification_icon.svg',
            width: 24.0,
          ),
        ],
      ),
    );
  }
}
