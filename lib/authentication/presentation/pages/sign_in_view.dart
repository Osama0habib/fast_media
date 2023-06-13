import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fast_media/home/presentaion/pages/home_view.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/core/shared/shared_widget.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_appbar.dart';
import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:fast_media/authentication/presentation/widgets/remember_me_checkbox.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/service_locator.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../widgets/forget_password_button.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/social_logins.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
        create: (context) => sl<SignInBloc>(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            }
          },
          child: BlocConsumer<SignInBloc, FormsValidate>(
            listener: (context, state) {
              print("error :${state.errorMessage}");
              if (state.errorMessage.isNotEmpty) {
                showSnakeBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                          'Welcome back please sign in again',
                                          textAlign: TextAlign.center,
                                          style: AppStyles.heading_3.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.4))),
                                    ),

                                    const SizedBox(
                                      height: 48.0,
                                    ),

//signIn form (email and password textFields)
                                    const SignInForm(),

// Remember me checkBox and forgetPassword Button
                                    Row(
                                      children: const [
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
                                      // isLoading: state.isLoading,
                                      btnText: 'Sign In',
                                      onPressed: () {
                                        context.read<SignInBloc>().add(
                                            SignInPressedEvent(
                                                SignInWithEmailParameter(
                                                    email: state.email,
                                                    password: state.password)));
                                      },
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
                    if (state.isLoading) const Loading(),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
