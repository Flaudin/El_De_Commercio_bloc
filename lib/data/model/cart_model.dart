class CartModel {
  String productName;
  String? color;
  String? size;
  double price;
  int quantity;
  String? imageUrl;

  CartModel({
    required this.productName,
    this.color,
    this.size,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });
}
