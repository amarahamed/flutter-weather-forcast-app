import 'package:geolocator/geolocator.dart';

class Location {
  Position _currentPosition;
  double _latitude, _longitude;
  Future<Position> getUserCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print('Location Fetched');

    setLatitude(_currentPosition.latitude);
    setLongitude(_currentPosition.longitude);

    return _currentPosition;
  }

  void setLatitude(double latitude) {
    this._latitude = latitude;
  }

  void setLongitude(double longitude) {
    this._longitude = longitude;
  }

  double getLongitude() {
    return _longitude;
  }

  double getLatitude() {
    return _latitude;
  }
}
