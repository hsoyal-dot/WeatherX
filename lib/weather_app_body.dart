import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'additional_info_cards.dart';
import 'hourly_forecast_cards.dart';

class WeatherAppBody extends StatefulWidget {
  const WeatherAppBody({super.key});

  @override
  State<WeatherAppBody> createState() => _WeatherAppBodyState();
}

class _WeatherAppBodyState extends State<WeatherAppBody> {
  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> getWeatherDetails() async {
    try {
      final cityName = 'Bhopal';
      final String apiKey = dotenv.env['API_KEY']!;
      final res = await http.get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey'));
      final data = jsonDecode(res.body);
      if (data['cod'] != "200") {
        throw "An unexpected error occured";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainCard();
  }

  mainCard() {
    return FutureBuilder(
      future: getWeatherDetails(),
      builder: (context, snapshot) {
        /* Progress Loader */
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        /* Returning Error */
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.hasError.toString()));
        }
        /* Collecting data */
        final data =
            snapshot.data!; //means data will for sure won't have null value

        /* Main Card variables */
        final currentTempinK = data['list'][0]['main']['temp'];
        final currentTempinC =
            '${(currentTempinK - 273.15).toStringAsFixed(1)}';
        final weatherIcon = data['list'][0]['weather'][0]['icon'];
        final currentCondition = data['list'][0]['weather'][0]['main'];
        final currentDescription = data['list'][0]['weather'][0]['description'];

        
        /* Additional Info variables */
        final humidity = data['list'][0]['main']['humidity'];
        final windSpeed = data['list'][0]['wind']['speed'];
        final pressure = data['list'][0]['main']['pressure'];

        /* MAIN CARD */
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text('$currentTempinC °C',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          ImageIcon(
                            NetworkImage(
                                'https://openweathermap.org/img/wn/$weatherIcon@2x.png'),
                            size: 80,
                          ),
                          Text(
                            '$currentCondition',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$currentDescription',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* ADDITIONAL INFO CARDS */
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Additional Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ), //Spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoCards(
                    cardIcon: Icons.water_drop,
                    cardLabel: "Humidity",
                    cardValue: '$humidity',
                  ),
                  AdditionalInfoCards(
                    cardIcon: Icons.wind_power_rounded,
                    cardLabel: "Wind Speed",
                    cardValue: '$windSpeed',
                  ),
                  AdditionalInfoCards(
                    cardIcon: Icons.air,
                    cardLabel: "Pressure",
                    cardValue: '$pressure',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              /* FORECASTED CARDS */
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Weather Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ), //Spacing
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      HourlyForecastCards(
                        forecastTime: DateFormat('h:mm a').format(
                            DateTime.parse(data['list'][i + 2]['dt_txt'])),
                        forecastIcon: ImageIcon(
                          NetworkImage(
                              'https://openweathermap.org/img/wn/${data['list'][i + 2]['weather'][0]['icon']}@2x.png'),
                          size: 52,
                          color: Colors.white,
                        ),
                        forecastTemperature:
                            '${double.parse(((data['list'][i + 2]['main']['temp']) - 273.15).toStringAsFixed(1))} °C',
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
