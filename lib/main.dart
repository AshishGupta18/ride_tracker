// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/ride_bloc.dart';
import 'services/ride_repository.dart';
import 'ui/screens/ride_history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Tracker', // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary theme color
      ),
      home: BlocProvider(
        create: (context) => RideBloc(rideRepository: RideRepository())..add(FetchRides()), // Provide the RideBloc to the widget tree
        child: RideHistoryScreen(), // Set the initial screen
      ),
    );
  }
}