import 'package:flutter/material.dart';

class HourlyForecastCards extends StatelessWidget {
  final String forecastTime;
  final ImageIcon forecastIcon;
  final String forecastTemperature;
  const HourlyForecastCards(
      {super.key,
      required this.forecastTime,
      required this.forecastIcon,
      required this.forecastTemperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              forecastTime,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            forecastIcon,
            Text(
              forecastTemperature,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white,
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
