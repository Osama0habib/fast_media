import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_appbar.dart';
import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          SvgPicture.asset(
            'assets/images/Splash.svg',
            fit: BoxFit.fill,
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 48.0,
              ),

              // my custom AppBar
              const CustomAppBar(
                title: 'Password',
              ),

              const SizedBox(
                height: 12.0,
              ),

              const Spacer(
                flex: 1,
              ),

              // body
              Text(
                'Forget Password',
                style: AppStyles.heading_1.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 18.0,
              ),

              //welcome message 2
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  'Please enter your email address to recive a verification card',
                  textAlign: TextAlign.center,
                  style: AppStyles.heading_3.copyWith(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),

              const SizedBox(
                height: 48.0,
              ),

              // email text
              const ForgetPasswordForm(),

              const SizedBox(
                height: 32.0,
              ),

              // Send reset card button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: DefaultButton(
                  btnText: 'Send',
                  onPressed: () {},
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
