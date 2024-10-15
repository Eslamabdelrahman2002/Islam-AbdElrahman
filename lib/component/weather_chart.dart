import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeatherChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,  // Set a fixed height to avoid layout issues
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 1:
                        return Text('Now',style: TextStyle(color: Colors.white),);
                      case 2:
                        return Text('22:00',style: TextStyle(color: Colors.white));
                      case 3:
                        return Text('23:00',style: TextStyle(color: Colors.white));
                      case 4:
                        return Text('4/5',style: TextStyle(color: Colors.white));
                      default:
                        return Text('',style: TextStyle(color: Colors.white));
                    }
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false
                )
              ),
              topTitles:AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: false
                  )
              ) ,
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}',style: TextStyle(color: Colors.white),);
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(1, 20),
                  FlSpot(2, 22),
                  FlSpot(3, 25),
                  FlSpot(4, 19),
                ],
                isCurved: true,
                color: Colors.white,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
