class LocationModel {
  final double latitude;
  final double longitude;
  final String address;
  final DateTime timestamp;

  LocationModel({
    required this.latitude,
    required this.longitude,
    this.address = '',
    required this.timestamp,
  });

  factory LocationModel.initial() {
    return LocationModel(
      latitude: 0.0,
      longitude: 0.0,
      timestamp: DateTime.now(),
    );
  }

  LocationModel copyWith({
    double? latitude,
    double? longitude,
    String? address,
    DateTime? timestamp,
  }) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
