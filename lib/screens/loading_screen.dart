import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as loading;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/services/weather_data.dart';
// add spinkit to the dependencies
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel weather = WeatherModel();

    void getLocationWeatherData() async {
      var currentWeatherData = await weather.getCurrentWeatherData();

      var forcastWeatherData = await weather.getForcastWeather();

      // push the next screen
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(currentWeatherData, forcastWeatherData);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        leading: IconButton(
          onPressed: () {
            print('btn pressed');
          },
          icon: Icon(FontAwesomeIcons.infoCircle),
        ),
      ),
      body: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    getLocationWeatherData();
  }

  void getLocationWeatherData() async {
    var currentWeatherData = await weather.getCurrentWeatherData();

    var forcastWeatherData = await weather.getForcastWeather();

    // push the next screen
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(currentWeatherData, forcastWeatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: loading.SpinKitPouringHourglass(
          color: Colors.white54,
          size: 60.0,
        ),
      ),
    );
  }
}
