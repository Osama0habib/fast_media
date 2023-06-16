import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_appbar.dart';
import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:fast_media/authentication/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/service_locator.dart';
import '../../../home/presentaion/pages/home_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => sl<SignUpBloc>(),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if(state is AuthenticationSuccess){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
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
                        title: 'Sign Up',
                      ),

                      const SizedBox(
                        height: 12.0,
                      ),

                      // body
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                children: [
                                  //welcome message 1
                                  Text(
                                    'Hello Welcome',
                                    style: AppStyles.heading_1
                                        .copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),

                                  //welcome message 2
                                  SizedBox(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.6,
                                    child: Text(
                                        'Welcome please enter your data to create your account',
                                        textAlign: TextAlign.center,
                                        style: AppStyles.heading_3.copyWith(
                                            color:
                                            Colors.white.withOpacity(0.4))),
                                  ),

                                  const SizedBox(
                                    height: 48.0,
                                  ),

                                  //signIn form (email and password textFields)
                                  const SignUpForm(),

                                  const SizedBox(
                                    height: 32.0,
                                  ),

                                  // Sign Up button
                                  DefaultButton(
                                    btnText: 'Sign Up',
                                    onPressed: () {
                                      context.read<SignUpBloc>().add(
                                          SignUpWithEmailEvent(
                                              email: state.email,
                                              password: state.password,
                                              userName: state.userName,
                                              phone: state.phone));
                                    },
                                  ),

                                  const SizedBox(height: 22.0),
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
          },
        ),
      ),
    );
  }
}
