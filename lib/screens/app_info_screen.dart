import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/utilities/utilities.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: linerGradientBackground),
        ),
        title: Text('App Info'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Clima Weather App',
              style: kNormalTextStyle,
            ),
            Text(
              'Version 1.0.0',
              style: kSubTextStyle,
            ),
            Image(
              image: AssetImage('images/AppLogo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Copyright '),
                Icon(
                  FontAwesomeIcons.copyright,
                  size: 14,
                ),
                Text(' 2021 Clima'),
              ],
            ),
            Text('All Rights Reserved'),
          ],
        ),
      ),
    );
  }
}
