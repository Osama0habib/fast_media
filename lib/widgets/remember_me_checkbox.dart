import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            visualDensity: VisualDensity.comfortable,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            value: true,
            activeColor: const Color(0xff1565DC),
            onChanged: (value) {},
          ),
        ),
        Text(
          'Remember me',
          style: AppStyles.inActive12.copyWith(color: kWireframe_1),
        ),
      ],
    );
  }
}
