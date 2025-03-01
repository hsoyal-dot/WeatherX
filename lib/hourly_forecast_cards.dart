import 'package:flutter/material.dart';

class HourlyForecastCards extends StatelessWidget {
  final String weatherTime;
  final ImageIcon weatherIcon;
  final String weatherTemperature;
  const HourlyForecastCards(
      {super.key,
      required this.weatherTime,
      required this.weatherIcon,
      required this.weatherTemperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              weatherTime,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            weatherIcon,
            Text(
              weatherTemperature,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
