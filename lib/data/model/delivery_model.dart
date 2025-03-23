enum DeliveryStatus { pending, accepted, inprogress, completed }

class DeliveryModel {
  final String id;
  final String pickupAddress;
  final String dropoffAddress;
  final double fare;
  final DateTime scheduleTime;
  final DeliveryStatus status;
  final List<String> items;

  DeliveryModel({
    required this.id,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.fare,
    required this.scheduleTime,
    this.status = DeliveryStatus.pending,
    required this.items,
  });
}
