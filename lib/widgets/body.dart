import 'package:flutter_web/material.dart';
import 'package:lets_find_your_things/utils/responsive_widget.dart';
import 'package:lets_find_your_things/widgets/large_screen.dart';
import 'package:lets_find_your_things/widgets/small_screen.dart';

class Body extends StatelessWidget {
  final backgroundImage = 'assets/flutter_image.jpg';

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}
