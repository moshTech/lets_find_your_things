import 'package:flutter/material.dart';
import 'package:lets_find_your_things/utils/my_color.dart';
import 'package:lets_find_your_things/utils/my_string.dart';

import 'email_box.dart';

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          addBackgroundImage(),
          addWelcomeText(),
        ],
      ),
    );
  }

  //Adds background Image
  Widget addBackgroundImage() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.asset(
        Strings.backgroundImage,
        scale: .85,
      ),
    );
  }

//Adds welcome text
  Widget addWelcomeText() {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
      widthFactor: .6, //covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.hello,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 60, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 40,
            ), //Give some spacing
            EmailBox() //Alert : this will be added after next step
          ],
        ),
      ),
    );
  }
}
