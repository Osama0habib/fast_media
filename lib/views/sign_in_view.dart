import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/widgets/custom_appbar.dart';
import 'package:fast_media/widgets/default_button.dart';
import 'package:fast_media/widgets/forget_password_button.dart';
import 'package:fast_media/widgets/remember_me_checkbox.dart';
import 'package:fast_media/widgets/sign_in_form.dart';
import 'package:fast_media/widgets/social_logins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                title: 'Sign In',
              ),

              const SizedBox(
                height: 12.0,
              ),

              // body
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          //welcome message 1
                          Text(
                            'Hello Welcome Back',
                            style: AppStyles.heading_1
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),

                          //welcome message 2
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text('Welcome back please sign in again',
                                textAlign: TextAlign.center,
                                style: AppStyles.heading_3.copyWith(
                                    color: Colors.white.withOpacity(0.4))),
                          ),

                          const SizedBox(
                            height: 48.0,
                          ),

                          //signIn form (email and password textFields)
                          const SignInForm(),

                          // Remember me checkBox and forgetPassword Button
                          const Row(
                            children: [
                              RememberMeCheckBox(),
                              Spacer(),
                              ForgetPasswordButton(),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 32.0,
                          ),

                          // Sign In button
                          DefaultButton(
                            btnText: 'Sign In',
                            onPressed: () {},
                          ),

                          const SizedBox(height: 48.0),

                          //social logins (google,facebook,apple)
                          const SocialLogins(),

                          const SizedBox(height: 22.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
