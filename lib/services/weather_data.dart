import 'package:weather/services/networker.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/api.dart';

const _currentWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const _forcastWeatherURL = 'https://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getCurrentWeatherData() async {
    Location location = Location();
    await location.getUserCurrentLocation();
    Networker networker = Networker(
        '$_currentWeatherURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');

    var weatherData = await networker.getLocationWeather();

    return weatherData;
  }

  // Forcast data 5 days/ every 3 hour
  Future<dynamic> getForcastWeather() async {
    Location location = Location();
    await location.getUserCurrentLocation();

    Networker networker = Networker(
        '$_forcastWeatherURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');

    var weatherForcastData = await networker.getLocationWeather();

    return weatherForcastData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
