import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.btnText,
    this.color,
    this.isLoading = false,
    this.fill = true,
    required this.onPressed,
  });

  final String btnText;
  final Color? color;
  final bool fill;
  final bool isLoading;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator.adaptive()
        : MaterialButton(
            onPressed: onPressed,
            color: fill ? color ?? kSeconderyColor : null,
            height: 58,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: fill
                  ? BorderSide.none
                  : const BorderSide(
                      color: kSeconderyColor,
                    ),
            ),
            child: Text(
              btnText,
              style: AppStyles.heading_2.copyWith(
                color: Colors.white,
              ),
            ),
          );
  }
}
