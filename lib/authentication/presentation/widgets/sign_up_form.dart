import 'package:fast_media/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/authentication/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc =context.read<SignUpBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // full name text
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Full Name',
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
          hint: 'Enter your name',
          prefixIcon: const Icon(Icons.person_outline),
          onchange:(String userName) => bloc.add(UserNameChangesEvent(userName)),
        ),

        const SizedBox(
          height: 18.0,
        ),

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
          prefixIcon: const Icon(Icons.lock_outline),
          onchange:(String password) => bloc.add(PasswordChangesEvent(password)),

        ),

        const SizedBox(
          height: 18.0,
        ),

        // phone number text
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Phone Number',
            style: AppStyles.heading_3.copyWith(
              color: kWireframe_3,
            ),
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        // phone number textField
         CustomTextField(
          hint: 'Enter your number',
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.phone_in_talk_outlined),
          onchange:(String phone) => bloc.add(PhoneChangesEvent(phone)),

        ),
      ],
    );
  }
}
