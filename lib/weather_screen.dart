import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather_app_body.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WeatherX',
          style: GoogleFonts.merriweather(),
        ),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("ref");
              },
              icon: Icon(Icons.refresh)
            )
        ],
      ),
      body: WeatherAppBody(),
    );
  }
}
