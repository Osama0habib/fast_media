import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        const CustomTextField(
          hint: 'Enter your name',
          prefixIcon: Icon(Icons.person_outline),
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
        const CustomTextField(
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined),
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
        const CustomTextField(
          hint: 'Enter your password',
          prefixIcon: Icon(Icons.lock_outline),
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
        const CustomTextField(
          hint: 'Enter your number',
          keyboardType: TextInputType.number,
          prefixIcon: Icon(Icons.phone_in_talk_outlined),
        ),
      ],
    );
  }
}
