import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
          backgroundColor: Colors.blue[600],
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            WeatherCard(
              cityName: 'Phnom Penh',
              minTemp: 10.0,
              maxTemp: 30.0,
              currentTemp: 12.2,
              color: [
                Colors.red,
                Colors.blue
              ],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Paris',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 22.2,
              color: [
                Colors.yellow,
                Colors.green
              ],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Rome',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 7.2,
              color: [
                Colors.purple,
                Colors.pink
              ],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Toulouse',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 45.2,
              color: [
                Colors.lightGreenAccent,
                Colors.lightBlue
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final List<Color> color;

  const WeatherCard({
    super.key,
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.color,
  });

  String _getWeatherImage() {
    if (currentTemp <= 10) {
      return 'assets/ex4/veryCloudy.png';
    } else if (currentTemp <= 20) {
      return 'assets/ex4/cloudy.png';
    } else if (currentTemp <= 30) {
      return 'assets/ex4/sunnyCloudy.png';
    } else {
      return 'assets/ex4/sunny.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: color,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -80,
              top: -20,
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    backgroundImage: AssetImage(_getWeatherImage()),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Min $minTemp°C',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Max $maxTemp°C',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    '$currentTemp°C',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}