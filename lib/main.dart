import 'package:flutter/material.dart';
import 'package:lets_find_your_things/home.dart';
import 'package:lets_find_your_things/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter to fly !',
      theme: MyAppThemes.appThemeBlue(context),
      home: MyHomePage(),
    );
  }
}
