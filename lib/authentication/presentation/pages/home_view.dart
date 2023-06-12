import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/authentication/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: DefaultButton(btnText: 'Log Out', onPressed: () {
      context.read<AuthenticationBloc>().add(AuthenticationSignedOut());
    },),),);
  }
}
