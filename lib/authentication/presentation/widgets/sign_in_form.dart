import 'package:fast_media/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignInBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // email text
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Email',
            style: AppStyles.heading_3.copyWith(
              color: kWireframe_3,
            ),
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        // email textField
         CustomTextField(
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,

          prefixIcon: const Icon(Icons.email_outlined),
          onchange:(String email) => bloc.add(EmailChangesEvent(email)),

        ),

        const SizedBox(
          height: 18.0,
        ),

        //password text
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Password',
            style: AppStyles.heading_3.copyWith(
              color: kWireframe_3,
            ),
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        //password TextField
         CustomTextField(
          hint: 'Enter your password',
          isPassword: true,
          prefixIcon: const Icon(Icons.lock_outline),
          onchange:(String password) => bloc.add(PasswordChangesEvent(password)),

        ),
      ],
    );
  }
}
