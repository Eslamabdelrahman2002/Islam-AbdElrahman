import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '085e6b439e074e3290e144447241409';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return WeatherModel.fromJson(data); // This should match the model's parsing logic
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
