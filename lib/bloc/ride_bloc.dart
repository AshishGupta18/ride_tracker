// lib/bloc/ride_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/services/ride_repository.dart';
import '/models/ride.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  final RideRepository rideRepository;

  RideBloc({required this.rideRepository}) : super(RideInitial()) {
    on<FetchRides>(_onFetchRides);
    on<ToggleBookmark>(_onToggleBookmark);
  }

  Future<void> _onFetchRides(FetchRides event, Emitter<RideState> emit) async {
    emit(RideLoading());
    try {
      final rides = await rideRepository.fetchRides();
      emit(RideLoaded(rides: rides));
    } catch (e) {
      emit(RideError(message: e.toString()));
    }
  }

  Future<void> _onToggleBookmark(ToggleBookmark event, Emitter<RideState> emit) async {
    try {
      await rideRepository.toggleBookmark(event.routeId, event.isBookmarked);
      // Update the UI by toggling the bookmark in the current list
      final currentState = state;
      if (currentState is RideLoaded) {
        final updatedRides = currentState.rides.map((ride) {
          if (ride.id == event.routeId) {
            return ride.copyWith(bookmarked: !event.isBookmarked);
          }
          return ride;
        }).toList();
        emit(RideLoaded(rides: updatedRides));
      }
    } catch (e) {
      emit(RideError(message: e.toString()));
    }
  }
}