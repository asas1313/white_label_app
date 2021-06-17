import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const textStyleMenu = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w900,
  letterSpacing: 1,
);

const textStyleDrawer = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w900,
  letterSpacing: 1,
);

class TextStyles {
  static TextAlign getTextAlignment(SizingInformation sizingInformation) {
    return sizingInformation.deviceScreenType == DeviceScreenType.desktop
        ? TextAlign.left
        : TextAlign.center;
  }

  static double getTitleSize(SizingInformation sizingInformation) {
    return sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? 50.0
        : 60.0;
  }
}
