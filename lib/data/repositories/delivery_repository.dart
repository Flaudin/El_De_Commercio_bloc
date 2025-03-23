import 'package:tracking_app/data/model/delivery_model.dart';

class DeliveryRepository {
  List<DeliveryModel> getUpcomingDeliveries() {
    return [
      DeliveryModel(
        id: '1',
        pickupAddress: 'Delivery 1',
        dropoffAddress: 'Address 1',
        fare: 100.0,
        scheduleTime: DateTime.now().add(Duration(hours: 1)),
        items: ['Item 1', 'Item 2'],
      ),
      DeliveryModel(
        id: '2',
        pickupAddress: 'Delivery 2',
        dropoffAddress: 'Address 2',
        fare: 200.0,
        scheduleTime: DateTime.now().add(Duration(hours: 2)),
        items: ['Item 3', 'Item 4'],
      ),
    ];
  }

  Future<bool> completeDelivery(String id) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<List<DateTime>> getAvailableScheds(DateTime date) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      DateTime(date.year, date.month, date.day, 9, 0),
      DateTime(date.year, date.month, date.day, 11, 0),
      DateTime(date.year, date.month, date.day, 13, 0),
      DateTime(date.year, date.month, date.day, 15, 0),
      DateTime(date.year, date.month, date.day, 17, 0),
    ];
  }
}
