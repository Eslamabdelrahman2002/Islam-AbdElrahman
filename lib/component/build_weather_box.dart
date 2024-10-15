import 'package:flutter/material.dart';

Widget buildWeatherBox(String label, String?value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: Color(0xFF16C9C9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            value!,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    ),
  );
}

