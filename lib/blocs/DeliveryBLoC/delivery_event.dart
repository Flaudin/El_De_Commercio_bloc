import 'package:equatable/equatable.dart';

abstract class DeliveryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDeliveriesEvent extends DeliveryEvent {}

class CompleteDeliveryEvent extends DeliveryEvent {
  final String deliveryId;

  CompleteDeliveryEvent(this.deliveryId);

  @override
  List<Object> get props => [deliveryId];
}

class FetchScheduleSlotsEvent extends DeliveryEvent {
  final DateTime date;

  FetchScheduleSlotsEvent(this.date);

  @override
  List<Object> get props => [date];
}
