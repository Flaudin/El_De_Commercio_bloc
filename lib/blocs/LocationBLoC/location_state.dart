import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/location_model.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationModel location;
  final List<LocationModel> locationHistory;

  LocationLoaded({required this.location, this.locationHistory = const []});

  @override
  List<Object?> get props => [location, locationHistory];

  LocationLoaded copyWith({
    LocationModel? location,
    List<LocationModel>? locationHistory,
  }) {
    return LocationLoaded(
      location: location ?? this.location,
      locationHistory: locationHistory ?? this.locationHistory,
    );
  }
}

class LocationError extends LocationState {
  final String message;

  LocationError({required this.message});

  @override
  List<Object?> get props => [message];
}
