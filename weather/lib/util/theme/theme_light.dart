import 'package:flutter/material.dart';

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor:
        (DateTime.now().hour == 0) ? Color(0xFF2488CF) : Color(0xFF071b29),
    primaryColor: Colors.white,
    textTheme: Typography(platform: TargetPlatform.android).white,
  );
}
