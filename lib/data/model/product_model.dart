class ProductModel {
  final int id;
  final String productName;
  final List<String> images;
  final bool isFavorite;
  final double rating;
  final int soldCount;
  final double price;
  final String description;
  final String size;
  final bool hasSize;
  final bool hasColor;
  final bool canBeSoldBySet;
  final bool isPopular;
  final bool isNew;
  final int brandId;
  final dynamic brand;
  final List<dynamic> sizes;
  final List<dynamic> colors;
  final List<dynamic> sets;

  ProductModel({
    required this.id,
    required this.productName,
    required this.images,
    required this.isFavorite,
    required this.rating,
    required this.soldCount,
    required this.price,
    required this.description,
    required this.size,
    required this.hasSize,
    required this.hasColor,
    required this.canBeSoldBySet,
    required this.isPopular,
    required this.isNew,
    required this.brandId,
    required this.brand,
    required this.sizes,
    required this.colors,
    required this.sets,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['productId'],
      productName: json['title'],
      images: List<String>.from(
        (json['images']?['\$values'] ?? []).map((e) => e.toString()),
      ),
      isFavorite: json['isFavorite'],
      rating: (json['rating'] as num).toDouble(),
      soldCount: json['soldCount'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      size: json['size'],
      hasSize: json['hasSize'],
      hasColor: json['hasColor'],
      canBeSoldBySet: json['canBeSoldBySet'],
      isPopular: json['isPopular'],
      isNew: json['isNew'],
      brandId: json['brandId'],
      brand: json['brand'], // Can later convert this to a BrandModel if needed
      sizes: json['sizes']?['\$values'] ?? [],
      colors: json['colors']?['\$values'] ?? [],
      sets: json['sets']?['\$values'] ?? [],
    );
  }
}
