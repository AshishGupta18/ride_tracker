// lib/bloc/ride_state.dart

part of 'ride_bloc.dart';

/// Abstract base class for ride states.
abstract class RideState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Initial state of the ride feature.
class RideInitial extends RideState {}

/// State indicating that rides are being loaded.
class RideLoading extends RideState {}

/// State representing successfully loaded rides.
class RideLoaded extends RideState {
  final List<Ride> rides;

  RideLoaded({required this.rides});

  @override
  List<Object> get props => [rides];
}

/// State indicating an error occurred during the fetching of rides.
class RideError extends RideState {
  final String message;

  RideError({required this.message});

  @override
  List<Object> get props => [message];
}