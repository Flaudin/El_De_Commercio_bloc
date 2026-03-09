class BrandModel {
  final int id;
  final String brandName;
  final bool isPopular;
  final bool isNew;
  final int? brandId;
  final int? categoryId;
  final String? logoUrl;

  BrandModel({
    required this.id,
    required this.brandName,
    this.isPopular = false,
    this.isNew = false,
    this.brandId,
    this.categoryId,
    this.logoUrl
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandName: json['name'],
      id: json['categoryId'], // Default to empty list if null
      isPopular: json['isPopular'] ?? false,
      isNew: json['isNew'] ?? false,
      brandId: json['brandId'],
      categoryId: json['categoryId'],
      logoUrl: json['logoUrl'],
    );
  }
}
