import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/location_model.dart';

abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCurrentLocationEvent extends LocationEvent {}

class StartLocationUpdatesEvent extends LocationEvent {}

class StopLocationUpdatesEvent extends LocationEvent {}

class LocationUpdateReceivedEvent extends LocationEvent {
  final LocationModel location;

  LocationUpdateReceivedEvent(this.location);

  @override
  List<Object> get props => [location];
}
