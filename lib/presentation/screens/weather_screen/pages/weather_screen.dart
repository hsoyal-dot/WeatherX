import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:weather_app/data/services/cities/city_services.dart';
import 'package:weather_app/presentation/screens/weather_screen/pages/weather_app_body.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // final ScrollController _scrollController = ScrollController();
  String selectedWeatherCity = 'New York';
  String selectedNewsCity = 'New York';
  bool isNewsManuallyChanged = false;

  @override
  Widget build(BuildContext context) {
    // final cities = [...CityService.getCities(), 'All'];

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
                setState(() {
                  WeatherAppBody();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: WeatherAppBody(),
    );
  }
}
