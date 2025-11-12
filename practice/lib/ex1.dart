import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
          backgroundColor: Colors.pink[50],
        ),
        body: Container(
          margin: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                backgroundColor: Color(0xFF048A09),
              ),
              HobbyCard(
                title: 'Skating',
                icon: Icons.skateboarding,
                backgroundColor: Color(0xFFACACAC),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Icon(icon, color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                title,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
