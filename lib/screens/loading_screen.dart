import 'dart:async';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather = WeatherModel();

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
   Map data = await weather.getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(data:data, weatherModel: weather,),
      ),
    );
  }
  
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
