// BLoC logic for Ride History screen


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<BlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
