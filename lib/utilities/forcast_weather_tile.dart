import 'package:flutter/material.dart';
import 'package:weather/utilities/utilities.dart';

class WeatherForcastTile extends StatelessWidget {
  final Map forcastWeatherHour;
  WeatherForcastTile({this.forcastWeatherHour});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: containerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              forcastWeatherHour['time'],
            ),
            Text(
              forcastWeatherHour['icon'],
              style: kTitleIconTextStyle,
            ),
            Text(
              '${forcastWeatherHour['temp']}°C',
              style: kTitleTextStyle,
            ),
            Text(
              forcastWeatherHour['status'],
              style: kTitleTextStyle,
            ),
            Text(
              forcastWeatherHour['date'],
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
