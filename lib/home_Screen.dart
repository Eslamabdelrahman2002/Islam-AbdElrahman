import 'package:flutter/material.dart';
import 'package:weather_app/weather_service.dart';
import 'component/build_weather_box.dart';
import 'component/weather_chart.dart';
import 'package:weather_app/models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';
  WeatherModel? weatherData;
  final WeatherService weatherService = WeatherService();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Container(

                padding: EdgeInsets.only(top: 77),
                child: TextField(
                  onSubmitted: (data) async {
                    if (data.isNotEmpty) {
                      setState(() {
                        cityName = data;
                        weatherData = null;
                        errorMessage = '';
                      });

                      try {
                        // Fetch weather data
                        weatherData = await weatherService.getWeather(cityName: cityName);
                        setState(() {}); // Trigger a rebuild to display weatherData
                      } catch (e) {
                        setState(() {
                          errorMessage = "Error fetching weather: $e";
                        });
                        debugPrint("Error fetching weather: $e");
                      }
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Color(0xFF1B6464)),
                    hintText: "Enter location",
                    hintStyle: TextStyle(color: Color(0xFF88BBBB)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Display error message if exists
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              // Display weather data if available
              if (weatherData != null)
                Expanded(
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF63C9C9).withOpacity(.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cityName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              Icon(Icons.favorite, color: Colors.white),
                            ],
                          ),
                          Text(
                            weatherData!.weatherStateName,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${weatherData!.temp}°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 65,
                                ),
                              ),
                              Image.asset(
                                'assets/weatherIcon.png',
                                height: 100,
                                width: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildWeatherBox('Highest', '${weatherData!.maxTemp}°C'),
                              buildWeatherBox('Lowest', '${weatherData!.minTemp}°C'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Container(
                  child: Center(
                    child: Text(
                      'Enter a location to get weather info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF63C9C9).withOpacity(.8),
                    ),
                    child: Column(
                
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF43CCCC).withOpacity(.8),
                              ),
                              child: Text('5 days weather forecast',style: TextStyle(color: Colors.white,fontSize: 15),),
                            ),
                          ),
                        ),
                
                        WeatherChart(),
                      ],
                    )),
              ),
              SizedBox(height: 50,)// Add the chart here
            ],
          ),
        ),
      ),
    );
  }
}
