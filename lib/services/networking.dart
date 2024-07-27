import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String key = 'bd5e378503939ddaee76f12ad7a97608';

  Future<Map> getData(double latitude, double longitude) async {
    var url = Uri.http(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': key,
        'units': 'metric'
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var temp = data['main']['temp'];
      var condition = data['weather'][0]['id'];
      var city = data['name'];
      return {
        'temp': temp,
        'condition': condition,
        'city': city,
      };
    } else {
      print('Failed to load weather data: ${response.statusCode}');
      return {};
    }
  }

  Future<Map> getCityData(String cityName) async {
    var url = Uri.http(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'q': cityName,
        'appid': key,
        'units': 'metric'
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var temp = data['main']['temp'];
      var condition = data['weather'][0]['id'];
      var city = data['name'];
      return {
        'temp': temp,
        'condition': condition,
        'city': city,
      };
    } else {
      print('Failed to load weather data: ${response.statusCode}');
      return {};
    }
  }
}
