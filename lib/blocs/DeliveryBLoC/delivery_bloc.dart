import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/DeliveryBLoC/delivery_event.dart';
import 'package:tracking_app/blocs/DeliveryBLoC/delivery_state.dart';
import 'package:tracking_app/data/repositories/delivery_repository.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryRepository deliveryRepository;

  DeliveryBloc(this.deliveryRepository) : super(DeliveryInitial()) {
    on<FetchDeliveriesEvent>(onGetDeliveries);
    on<CompleteDeliveryEvent>(onCompleteDelivery);
    on<FetchScheduleSlotsEvent>(onGetAvailableSlots);
  }

  Future<void> onGetDeliveries(
    FetchDeliveriesEvent event,
    Emitter<DeliveryState> emit,
  ) async {
    emit(DeliveryLoading());
    try {
      final deliveries = deliveryRepository.getUpcomingDeliveries();
      emit(DeliveryLoaded(deliveries: deliveries));
    } catch (e) {
      emit(DeliveryError(message: e.toString()));
    }
  }

  Future<void> onCompleteDelivery(
    CompleteDeliveryEvent event,
    Emitter<DeliveryState> emit,
  ) async {
    emit(DeliveryLoading());
    try {
      final success = await deliveryRepository.completeDelivery(
        event.deliveryId,
      );
      if (success) {
        emit(DeliveryCompleted(deliveryId: event.deliveryId));
      } else {
        emit(DeliveryError(message: 'Failed to complete delivery'));
      }
    } catch (e) {
      emit(DeliveryError(message: e.toString()));
    }
  }

  Future<void> onGetAvailableSlots(
    FetchScheduleSlotsEvent event,
    Emitter<DeliveryState> emit,
  ) async {
    emit(DeliveryLoading());
    try {
      final slots = await deliveryRepository.getAvailableScheds(event.date);
      emit(AvailableSlotsLoaded(slots: slots, date: event.date));
    } catch (e) {
      emit(DeliveryError(message: e.toString()));
    }
  }
}
