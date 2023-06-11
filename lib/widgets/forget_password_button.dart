import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:fast_media/views/forget_password_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ForgetPasswordView(),
          ),
        );
      },
      child: Text(
        'Forget Password',
        style: AppStyles.inActive12.copyWith(color: kSeconderyColor),
      ),
    );
  }
}
