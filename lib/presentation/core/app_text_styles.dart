import 'package:flutter/material.dart';
import 'app_colors.dart';

const _lato = "Lato";

class AppTextStyles {
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    height: 22.4 / 16,
    color: AppColors.nero,
    fontWeight: FontWeight.w700,
    fontFamily: _lato,
  );
  static const TextStyle body_1 = TextStyle(
    fontSize: 14,
    height: 19.6 / 14,
    color: AppColors.nero,
    fontWeight: FontWeight.w700,
    fontFamily: _lato,
  );
  static const TextStyle body_2 = TextStyle(
    fontSize: 14,
    height: 19.6 / 14,
    color: AppColors.nero,
    fontWeight: FontWeight.w500,
    fontFamily: _lato,
  );
}
