import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/utilities/utilities.dart';
import 'package:weather/screens/app_info_screen.dart';

void main() => runApp(Clima());

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/loadingScreen': (context) => Loading(),
        '/appInfoScreen': (context) => AppInfoScreen(),
        // '/'
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            size: 18.0,
          ),
        ),
        primaryColor: gradientColor1,
        scaffoldBackgroundColor: gradientColor1,
        textTheme: TextTheme(
          body1: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      initialRoute: '/loadingScreen',
    );
  }
}
