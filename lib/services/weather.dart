import 'dart:async';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Location location = Location();

  Future<Map> getLocationData() async {
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper();

    var data =
        await networkHelper.getData(location.latitude, location.longitude);
    return data;
  }

  Future<Map> getCityData(String cityName)async{
    NetworkHelper networkHelper = NetworkHelper();
    var data =
        await networkHelper.getCityData(cityName);
    return data;
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
