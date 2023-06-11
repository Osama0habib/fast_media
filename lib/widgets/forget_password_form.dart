import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}
