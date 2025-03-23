import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/delivery_model.dart';

abstract class DeliveryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

class DeliveryLoaded extends DeliveryState {
  final List<DeliveryModel> deliveries;

  DeliveryLoaded({required this.deliveries});

  @override
  List<Object?> get props => [deliveries];
}

class DeliveryCompleted extends DeliveryState {
  final String deliveryId;

  DeliveryCompleted({required this.deliveryId});

  @override
  List<Object?> get props => [deliveryId];
}

class AvailableSlotsLoaded extends DeliveryState {
  final List<DateTime> slots;
  final DateTime date;

  AvailableSlotsLoaded({required this.slots, required this.date});

  @override
  List<Object?> get props => [slots, date];
}

class DeliveryError extends DeliveryState {
  final String message;

  DeliveryError({required this.message});

  @override
  List<Object?> get props => [message];
}
