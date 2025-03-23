import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/LocationBLoC/location_event.dart';
import 'package:tracking_app/blocs/LocationBLoC/location_state.dart';
import 'package:tracking_app/data/model/location_model.dart';
import 'package:tracking_app/data/repositories/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;
  StreamSubscription<LocationModel>? locationSubscription;

  LocationBloc(this.locationRepository) : super(LocationInitial()) {
    on<GetCurrentLocationEvent>(onGetCurrentLocation);
    on<StartLocationUpdatesEvent>(onStartLocationUpdates);
    on<StopLocationUpdatesEvent>(onStopLocationUpdates);
    on<LocationUpdateReceivedEvent>(onLocationUpdateReceived);
  }

  Future<void> onGetCurrentLocation(
    GetCurrentLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    try {
      final location = await locationRepository.getCurrentLocation();
      if (location != null) {
        emit(LocationLoaded(location: location, locationHistory: [location]));
      } else {
        emit(LocationError(message: 'Failed to get current location'));
      }
    } catch (e) {
      emit(LocationError(message: e.toString()));
    }
  }

  Future<void> onStartLocationUpdates(
    StartLocationUpdatesEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    await locationRepository.checkPermission();

    locationSubscription?.cancel();
    locationSubscription = locationRepository.getLocationUpdates().listen(
      (location) {
        add(LocationUpdateReceivedEvent(location));
      },
      onError: (error) {
        emit(LocationError(message: 'Location update error: $error'));
      },
    );
  }

  Future<void> onStopLocationUpdates(
    StopLocationUpdatesEvent event,
    Emitter<LocationState> emmit,
  ) async {
    await locationSubscription?.cancel();
    locationSubscription = null;
  }

  Future<void> onLocationUpdateReceived(
    LocationUpdateReceivedEvent event,
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationLoaded) {
      final currentState = state as LocationLoaded;
      List<LocationModel> updatedHistory = List.from(
        currentState.locationHistory,
      )..add(event.location);

      emit(
        currentState.copyWith(
          location: event.location,
          locationHistory: updatedHistory,
        ),
      );
    } else {
      emit(
        LocationLoaded(
          location: event.location,
          locationHistory: [event.location],
        ),
      );
    }
  }

  @override
  Future<void> close() {
    locationSubscription?.cancel();
    return super.close();
  }
}
