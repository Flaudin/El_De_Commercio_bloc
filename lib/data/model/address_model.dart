class AddressModel {
  String title;
  String streetno;
  String houseno;
  String postalcode;
  String city;
  bool isDefault;

  AddressModel({
    required this.title,
    required this.streetno,
    required this.houseno,
    required this.postalcode,
    required this.city,
    required this.isDefault,
  });
}

class AddressData {
  static List<AddressModel> sampleAddress() {
    return [
      AddressModel(
        title: 'Home',
        streetno: '143 Liwanag St.',
        houseno: '143',
        postalcode: '1108',
        city: 'Quezon City',
        isDefault: true,
      ),
    ];
  }
}
