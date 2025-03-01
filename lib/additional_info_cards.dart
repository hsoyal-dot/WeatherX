import 'package:flutter/material.dart';

class AdditionalInfoCards extends StatelessWidget {
  final IconData cardIcon;
  final String cardLabel;
  final String cardValue;

  const AdditionalInfoCards(
      {super.key,
      required this.cardIcon,
      required this.cardLabel,
      required this.cardValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(
              cardIcon,
              size: 35,
            ),
            SizedBox(height: 10,),
            Text(
              cardLabel,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              cardValue,
              style: TextStyle(
                fontSize: 18,
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
