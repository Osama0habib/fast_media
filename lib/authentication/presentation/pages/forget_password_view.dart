import 'package:fast_media/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fast_media/core/shared/shared_widget.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_appbar.dart';
import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/service_locator.dart';
import '../widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => sl<SignInBloc>(),
      child: BlocConsumer<SignInBloc, FormsValidate>(
        listener: (context, state) async {
          if (state is ForgetPasswordSuccess) {
            // final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
            // if (initialLink != null) {
            //   print("initialLink $initialLink");
            //   final Uri deepLink = initialLink.link;
            //   // Example of using the dynamic link to push the user to a different screen
            //   if(deepLink.path == "NewPassword"){
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const ForgetPasswordCodePage(),
            //       ),
            //     );
            //   }
            // }
            FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
              print("dynamicLinkData : $dynamicLinkData");
              // Navigator.pushNamed(context, dynamicLinkData.link.path);
            }).onError((error) {
              // Handle errors
            });
            if (state.errorMessage.isNotEmpty) {
              if (state.errorMessage.isNotEmpty) {
                showSnakeBar(context, state.errorMessage);
              }
            }
          }
        },
        builder: (context, state) {
          final bloc = context.read<SignInBloc>();
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
                        onPressed: () {
                          bloc.add(ForgetPasswordEvent(state.email));
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                ),
                if (state.isLoading) const Loading(),
              ],
            ),
          );
        },
      ),
    );
  }
}
