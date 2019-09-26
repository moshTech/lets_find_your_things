import 'package:flutter_web/material.dart';
import 'package:lets_find_your_things/utils/my_color.dart';
import 'package:lets_find_your_things/utils/my_string.dart';
import 'package:lets_find_your_things/utils/responsive_widget.dart';

class SubscribeButton extends StatelessWidget {
  final emailImage = "assets/email.png";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.blue1, MyColors.blue2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: MyColors.blue3.withOpacity(.3),
                  offset: Offset(0, 8),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: buildButton(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    if (ResponsiveWidget.isSmallScreen(context))
      return buildSmallButton(context);
    else
      return buildLargeButton(context);
  }

  Widget buildSmallButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Image.asset(
          emailImage,
          color: MyColors.white1,
          width: ResponsiveWidget.isSmallScreen(context)
              ? 12
              : ResponsiveWidget.isMediumScreen(context) ? 12 : 20,
          height: ResponsiveWidget.isSmallScreen(context)
              ? 12
              : ResponsiveWidget.isMediumScreen(context) ? 12 : 20,
        )
      ],
    );
  }

  Widget buildLargeButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Strings.subscribeButton,
          style: TextStyle(
            color: MyColors.white1,
            fontSize: ResponsiveWidget.isMediumScreen(context) ? 12 : 16,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          width: ResponsiveWidget.isMediumScreen(context) ? 6 : 8,
        ),
        Image.asset(
          emailImage,
          color: MyColors.white1,
          width: ResponsiveWidget.isMediumScreen(context) ? 12 : 20,
          height: ResponsiveWidget.isMediumScreen(context) ? 12 : 20,
        )
      ],
    );
  }
}
