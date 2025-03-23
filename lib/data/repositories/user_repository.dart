import 'package:tracking_app/data/model/user_model.dart';
import 'package:tracking_app/data/model/vehicle_model.dart';

class UserRepository {
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(Duration(seconds: 2));
    return UserModel(
      id: 'user123',
      name: 'John Doughter',
      phoneNumber: '+1 234 567 890',
      email: 'john@example.com',
      profileImage: 'assets/profile.png',
      vehicles: [
        VehicleModel(
          id: 'v1',
          type: 'Sedan',
          name: 'Toyota Corolla',
          licensePlate: 'ABC 123',
        ),
      ],
    );
  }

  Future<List<String>> getPaymentMethods() async {
    await Future.delayed(Duration(seconds: 2));
    return ['Credit Card', 'Paypal', 'Cash'];
  }
}
