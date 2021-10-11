import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/services/weather_data.dart';
import 'package:weather/utilities/utilities.dart';
import 'package:weather/utilities/reusable_container.dart';
import 'package:weather/utilities/bottomRowBuild.dart';
import 'package:weather/utilities/forcast_weather_tile.dart';

class HomeScreen extends StatefulWidget {
  final currentLocaionWeather;
  final forcastLocationWeather;
  HomeScreen(this.currentLocaionWeather, this.forcastLocationWeather);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();
  var currentWeatherInfo = {};
  /* Forcast Weather Variables  */
  var forcastWeatherHour1 = {};
  var forcastWeatherHour2 = {};
  var forcastWeatherHour3 = {};

  @override
  void initState() {
    super.initState();
    updateUI(widget.currentLocaionWeather, widget.forcastLocationWeather);
  }

  void updateUI(dynamic currentWeatherData, dynamic forcastWeatherData) {
    setState(() {
      /* Current weather data */
      // Top Screen
      if (currentWeatherData != null) {
        currentWeatherInfo = {
          'temp': currentWeatherData['main']['temp'].toInt(),
          'cityName': currentWeatherData['name'],
          'country': currentWeatherData['sys']['country'] ?? '',
          'time': readTimestamp(currentWeatherData['dt'])['time'],
          'date': readTimestamp(currentWeatherData['dt'])['date'],
          'status': currentWeatherData['weather'][0]['main'],
          'temp_min': currentWeatherData['main']['temp_min'].toInt(),
          'temp_max': currentWeatherData['main']['temp_max'].toInt(),
          'humidity': currentWeatherData['main']['humidity'],
          'sea_level': currentWeatherData['main']['sea_level'],
          'longitude': currentWeatherData['coord']['lon'].toStringAsFixed(1),
          'latitude': currentWeatherData['coord']['lat'].toStringAsFixed(1),
          'icon':
              weather.getWeatherIcon(currentWeatherData['weather'][0]['id']),
        };
        readUNIXTime(currentWeatherData['dt']);
      } else {
        print('Current Weather Data fail to fetch from the API');
      }
      if (forcastWeatherData != null) {
        forcastWeatherHour1 = {
          'time': readTimestamp(forcastWeatherData['list'][0]['dt'])['time'] ??
              'err',
          'icon': weather.getWeatherIcon(
                  forcastWeatherData['list'][0]['weather'][0]['id']) ??
              '',
          'temp': forcastWeatherData['list'][0]['main']['temp']
                  .toStringAsFixed(0) ??
              '❎',
          'status': forcastWeatherData['list'][0]['weather'][0]['main'] ?? '❎',
          'date': readTimestamp(forcastWeatherData['list'][0]['dt'])['date'] ??
              'error',
        };
        forcastWeatherHour2 = {
          'time': readTimestamp(forcastWeatherData['list'][1]['dt'])['time'] ??
              'err',
          'icon': weather.getWeatherIcon(
                  forcastWeatherData['list'][1]['weather'][0]['id']) ??
              '',
          'temp': forcastWeatherData['list'][1]['main']['temp']
                  .toStringAsFixed(0) ??
              '❎',
          'status': forcastWeatherData['list'][1]['weather'][0]['main'] ?? '❎',
          'date': readTimestamp(forcastWeatherData['list'][1]['dt'])['date'] ??
              'error',
        };
        forcastWeatherHour3 = {
          'time': readTimestamp(forcastWeatherData['list'][2]['dt'])['time'] ??
              'err',
          'icon': weather.getWeatherIcon(
                  forcastWeatherData['list'][2]['weather'][0]['id']) ??
              '',
          'temp': forcastWeatherData['list'][2]['main']['temp']
                  .toStringAsFixed(0) ??
              '❎',
          'status': forcastWeatherData['list'][2]['weather'][0]['main'] ?? '❎',
          'date': readTimestamp(forcastWeatherData['list'][2]['dt'])['date'] ??
              'error',
        };
      } else {
        print('Forcast Weather Data fail to fetch from the API');
      }
      print('TEMP -----------> ${currentWeatherInfo['temp']}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Scaffold background color : https://www.kindacode.com/article/flutter-set-gradient-background-color-for-entire-screen/
      decoration: BoxDecoration(
        gradient: linerGradientBackground,
      ),
      child: Scaffold(
        // default color is white
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: linerGradientBackground),
          ),
          title: Text('HOME'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/appInfoScreen');
              print('App Info Button pressed');
            },
            icon: Icon(FontAwesomeIcons.infoCircle),
          ),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.syncAlt),
              onPressed: () async {
                var newCurrentData = await weather.getCurrentWeatherData();
                var newForcastData = await weather.getForcastWeather();
                updateUI(newCurrentData, newForcastData);
                print('Page refreshed');
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.mapMarkerAlt,
              ),
              onPressed: () {
                print('Route Button pressed');
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Top Screen
            Expanded(
              flex: 2,
              child: ResuableCard(
                // Temp and Location
                containerColor: containerColor,
                cardChild: Row(
                  children: <Widget>[
                    // City + Country
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //   '${currentWeatherInfo['cityName']} | ${currentWeatherInfo['country']}',
                          //   style: kNormalTextStyle,
                          // ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${currentWeatherInfo['cityName'] ?? 'Unknown'}',
                                style: kNormalTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kNormalTextStyle,
                              ),
                              Text(
                                '${currentWeatherInfo['country']}',
                                style: kNormalTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Data for ⏰ ${currentWeatherInfo['time']}',
                            style: kSubTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Status ${currentWeatherInfo['icon']} ${currentWeatherInfo['status']}',
                            style: kSubTextStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Lat ➭ ${currentWeatherInfo['latitude']}',
                                style: kSubTextStyle,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Lon ➭ ${currentWeatherInfo['longitude']}',
                                  style: kSubTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 10.0,
                    ),

                    // Temperature
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              gradientColor1,
                              gradientColor2,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(3.0, 0.2),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white10,
                              offset: Offset(0.0, 1.0), //(x,y)
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          '${currentWeatherInfo['temp']}°C',
                          style: kTemperatureTextStyle,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ************ Mid Screen *****************
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: WeatherForcastTile(
                        forcastWeatherHour: forcastWeatherHour1,
                      ),
                    ),
                    Expanded(
                      child: WeatherForcastTile(
                        forcastWeatherHour: forcastWeatherHour2,
                      ),
                    ),
                    Expanded(
                      child: WeatherForcastTile(
                        forcastWeatherHour: forcastWeatherHour3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Screen
            Expanded(
              flex: 2,
              child: ResuableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'ADDITIONAL INFO FOR : ${currentWeatherInfo['date']}',
                      style: kSubTitleTextStyle,
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    BottomContainerRow(
                      label1: 'TEMP MIN',
                      value1: currentWeatherInfo['temp_min'],
                      label2: 'TEMP MAX',
                      value2: currentWeatherInfo['temp_max'],
                    ),
                    BottomContainerRow(
                      label1: 'HUMIDITY',
                      value1: currentWeatherInfo['humidity'],
                      label2: 'SEA LEVEL',
                      value2: currentWeatherInfo['sea_level'],
                    ),
                  ],
                ),
                containerColor: containerColor,
              ),
            ),
          ],
          // END
        ),
      ),
    );
  }
}
