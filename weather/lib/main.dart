import 'package:flutter/material.dart';
import 'package:weather/util/theme/theme_dark.dart' as dark;
import 'package:weather/util/theme/theme_light.dart'as light;

import
 'package:weather/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      theme: light.themeLight(),
      home: Home(),
    );
  }
}
