import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    required this.onchange,
  });
  final String? hint;
  final Widget? prefixIcon;
  final bool isPassword;
  final Function(String) onchange;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        enableInteractiveSelection: false,
        style: const TextStyle(color: Colors.white),
        onChanged: onchange,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: kWireframe_4,
          hintText: hint,
          hintStyle: AppStyles.heading_2.copyWith(color: kWireframe_4),
          prefixIcon: prefixIcon,
          prefixIconColor: kWireframe_3,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 22.0,
          ),
        ),
      ),
    );
  }
}
