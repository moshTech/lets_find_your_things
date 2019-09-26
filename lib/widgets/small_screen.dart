import 'package:flutter_web/material.dart';
import 'package:lets_find_your_things/utils/my_color.dart';
import 'package:lets_find_your_things/utils/my_string.dart';

import 'email_box.dart';

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Strings.hello,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: MyColors.blue4,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: Strings.welcomeTo,
                      style: TextStyle(fontSize: 40, color: MyColors.blue4),
                      children: [
                        TextSpan(
                            text: Strings.ftf,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54))
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    Strings.backgroundImage,
                    scale: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 20),
                  child: Text(Strings.subscribeText),
                ),
                SizedBox(
                  height: 30,
                ),
                EmailBox(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: factBot(context),
          // ),
        ],
      ),
    );
  }
}
