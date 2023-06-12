import 'package:fast_media/authentication/presentation/pages/sign_in_view.dart';
import 'package:fast_media/authentication/presentation/pages/sign_up_view.dart';

import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/Splash.svg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: w * 0.7,
                ),
                const SizedBox(
                  height: 32,
                ),
                const SizedBox(
                  height: 42,
                ),
                DefaultButton(
                  btnText: 'Sign In',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                DefaultButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                  btnText: 'Sign Up',
                  fill: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
