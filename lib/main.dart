import 'package:flutter/material.dart';
import 'package:lets_find_your_things/utils/themes.dart';

import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find it !',
      theme: MyAppThemes.appThemeBlue(context),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
