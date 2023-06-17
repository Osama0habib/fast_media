import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class SettingRowButton extends StatelessWidget {
  const SettingRowButton({
    super.key,
    required this.prefix,
    required this.suffix,
    required this.title,
    this.onTap,
  });
  final Widget prefix;
  final Widget suffix;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                prefix,
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  title,
                  style: AppStyles.heading_3.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                suffix,
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Divider(
            color: kWireframe_2,
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
