import 'package:flutter/material.dart';  
import '../utils/app_color.dart';

 class AppTextStyles {
  AppTextStyles._();
  static  final TextStyle inter600Size12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColor.iconMuted,
  );

  static  final TextStyle inter700Size20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: AppColor.secondaryText,
  );

  static final TextStyle inter600Size14OnDark = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  color: AppColor.white,
);

static final TextStyle inter600Size14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  color: AppColor.primaryText,
);

static final TextStyle inter600Size11Label = TextStyle(
  fontSize: 11,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  color: AppColor.mutedText,
  letterSpacing: 0.5,
);

static final TextStyle inter400Size14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: AppColor.mutedText,
);

static final TextStyle inter500Size14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  color: AppColor.secondaryText,
);
}