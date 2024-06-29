import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {  
  Location location = Location();
  @override
  void initState() {
    super.initState();
    location.getCurrentLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: location.getCurrentLocation,
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
