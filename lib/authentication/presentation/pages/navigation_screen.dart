import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/authentication/presentation/pages/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentaion/pages/home_view.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const HomeView();
        } else {
          return const SplashView();
        }
      },
    );
  }
}
