class WeatherModel {
  final String weatherStateName; // e.g., "Partly cloudy"
  final double temp; // e.g., 14.0
  final double maxTemp; // e.g., maximum temp
  final double minTemp; // e.g., minimum temp

  WeatherModel({
    required this.weatherStateName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherStateName: json['current']['condition']['text'], // Get weather description
      temp: json['current']['temp_c'].toDouble(), // Current temperature
      maxTemp: json['current']['temp_c'], // Replace with actual max temperature if available
      minTemp: json['current']['temp_c'], // Replace with actual min temperature if available
    );
  }
}