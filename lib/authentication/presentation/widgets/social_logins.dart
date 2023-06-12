
import 'dart:io';

import 'package:fast_media/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignInBloc>();
    return Column(
      children: [
        Text('OR', style: AppStyles.heading_3.copyWith(color: kSeconderyColor)),
        const SizedBox(
          height: 32.0,
        ),

        // Dividers
        Row(
          children: [
            Expanded(
                child: Divider(
              color: kWireframe_3,
              endIndent: 18.0,
            )),
            Text('Sing in with',
                style: AppStyles.heading_3.copyWith(color: kWireframe_3)),
            Expanded(
                child: Divider(
              color: kWireframe_3,
              indent: 18.0,
            )),
          ],
        ),

        const SizedBox(height: 32),

        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => bloc.add(const GooglePressedEvent()),
              child: SvgPicture.asset(
                'assets/images/google.svg',
                width: 28,
                height: 28,
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            InkWell(
              onTap: () => bloc.add(const FaceBookPressedEvent()),
              child: SvgPicture.asset(
                'assets/images/Facebook.svg',
                width: 28,
                height: 28,
              ),
            ),
            if(Platform.isIOS || Platform.isIOS)
              const SizedBox(
              width: 22,
            ),
            if(Platform.isIOS || Platform.isIOS)
            InkWell(
              onTap: () => bloc.add(const ApplePressedEvent()),
              child: SvgPicture.asset(
                'assets/images/apple.svg',
                width: 32,
                height: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
