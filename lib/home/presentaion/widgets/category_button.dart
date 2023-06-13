import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.btnText,
  });
  final bool isSelected;
  final void Function()? onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
            border: isSelected
                ? null
                : const GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffF6C700),
                        Color(0xff90824B),
                        Color(0xff2A2F4F),
                      ],
                    ),
                  ),
          ),
          child: Text(
            btnText,
            style: AppStyles.heading_3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
