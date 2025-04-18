class LoginCredentials {
  final String email;
  final String password;
  final String? address;
  final String? birthday;
  final String? phonenumber;

  LoginCredentials({
    required this.email,
    required this.password,
    this.address,
    this.birthday,
    this.phonenumber,
  });

  factory LoginCredentials.fromJson(Map<String, dynamic> json) {
    return LoginCredentials(
      email: json['email'],
      password: json['password'],
      address: json['address'],
      birthday: json['birthday'],
      phonenumber: json['phonenumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'address': address,
      'birthday': birthday,
      'phonenumber': phonenumber,
    };
  }
}
