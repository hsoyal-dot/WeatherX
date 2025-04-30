import 'package:flutter/material.dart';

class CityDropdown extends StatelessWidget {
  final List<String> cities;
  final String selectedCity;
  final void Function(String?) onChanged;

  const CityDropdown({
    required this.cities,
    required this.selectedCity,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCity,
      items: cities.map((city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.grey[900],
      style: TextStyle(color: Colors.white),
    );
  }
}