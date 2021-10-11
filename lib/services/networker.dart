import 'dart:convert';
import 'package:http/http.dart' as http;

class Networker {
  String _url;

  Networker(this._url);

  Future getLocationWeather() async {
    http.Response response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);
    } else {
      print('API Response Failed Status Code: ${response.statusCode}');
      print('Reason ${response.body}');
    }
  }
}
