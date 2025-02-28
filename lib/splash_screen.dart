import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white,
            ),
            Text(
              "WeatherX",
              style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
        duration: 3000,
        splashTransition: SplashTransition.slideTransition,
        nextScreen: WeatherScreen());
  }
}
