// lib/bloc/ride_event.dart

part of 'ride_bloc.dart';

/// Abstract base class for ride events.
abstract class RideEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event to fetch rides.
class FetchRides extends RideEvent {}

/// Event to toggle the bookmark status of a specific ride.
class ToggleBookmark extends RideEvent {
  final int routeId;
  final bool isBookmarked;

  ToggleBookmark({required this.routeId, required this.isBookmarked});

  @override
  List<Object> get props => [routeId, isBookmarked];
}