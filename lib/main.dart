//Entry point of the application
// lib/main.dart
import 'package:flutter/material.dart';
import 'ui/screens/ride_history_screen.dart';

void main() {
  runApp(RideTrackerApp());
}

class RideTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RideHistoryScreen(),
    );
  }
}