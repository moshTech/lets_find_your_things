import 'package:flutter_web/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen, mediumScreen, smallScreen;

  const ResponsiveWidget(
      {Key key, this.largeScreen, this.mediumScreen, this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return the widget which is more appropriate for the screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        // For the large screen
        if (constraints.maxWidth > 1200)
          return largeScreen;
        // For the medium screen: if medium screen is not available then return large screen
        else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200)
          return mediumScreen ?? largeScreen;
        // For the small screen: if small screen is not available then return large screen
        else
          return smallScreen ?? largeScreen;
      },
    );
  }

  // Large screen with width > 1200
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  // Medium screen with width btween 800 & 1200
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 800 &&
      MediaQuery.of(context).size.width < 1200;

  // Small screen with width < 800
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
}
