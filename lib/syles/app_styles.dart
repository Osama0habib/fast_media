import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle heading_1 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading_2 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle heading_3 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardButton = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle inActive14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle inActive12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}
