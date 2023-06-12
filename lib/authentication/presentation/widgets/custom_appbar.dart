import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            title,
            style: AppStyles.heading_1.copyWith(color: Colors.white),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
