class CategoryModel {
  final String id;
  String iconsName;
  String title;
  final List<dynamic> products;
  CategoryModel({
    required this.id,
    required this.iconsName,
    required this.title,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      iconsName: json['icon'].toString(),
      title: json['title'],
      id: json['CategoryId'],
      products: json['products'] ?? [], // Default to empty list if null
    );
  }

  // Convert icon name to actual Icon widget (not stored in model)
}

// class CategoryData {
//   static List<CategoryModel> sampleCategory() {
//     return [
//       CategoryModel(
//         iconsName: const Icon(Icons.devices, color: Colors.green, size: 32),
//         title: "Electronics",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.chair, color: Colors.brown, size: 32),
//         title: "Furniture",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.fitness_center,
//           color: Colors.red,
//           size: 32,
//         ),
//         title: "Sports",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.diamond, color: Colors.purple, size: 32),
//         title: "Jewelry",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.kitchen, color: Colors.orange, size: 32),
//         title: "Kitchen",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.book, color: Colors.teal, size: 32),
//         title: "Books",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.toys, color: Colors.pink, size: 32),
//         title: "Toys",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.spa, color: Colors.lightGreen, size: 32),
//         title: "Beauty",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.smartphone, color: Colors.indigo, size: 32),
//         title: "Phones",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.watch, color: Colors.amber, size: 32),
//         title: "Watches",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.local_grocery_store,
//           color: Colors.deepOrange,
//           size: 32,
//         ),
//         title: "Groceries",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.home, color: Colors.lightBlue, size: 32),
//         title: "Home Decor",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.headphones, color: Colors.grey, size: 32),
//         title: "Audio",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.computer, color: Colors.blueGrey, size: 32),
//         title: "Computers",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.directions_car,
//           color: Colors.red,
//           size: 32,
//         ),
//         title: "Automotive",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.pets, color: Colors.brown, size: 32),
//         title: "Pet Supplies",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.local_florist,
//           color: Colors.pink,
//           size: 32,
//         ),
//         title: "Garden",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.sports_basketball,
//           color: Colors.orange,
//           size: 32,
//         ),
//         title: "Sports Gear",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.videogame_asset,
//           color: Colors.deepPurple,
//           size: 32,
//         ),
//         title: "Gaming",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.child_care, color: Colors.cyan, size: 32),
//         title: "Baby",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.shopping_basket,
//           color: Colors.amber,
//           size: 32,
//         ),
//         title: "Handmade",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.camera_alt, color: Colors.black, size: 32),
//         title: "Cameras",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(
//           Icons.card_giftcard,
//           color: Colors.redAccent,
//           size: 32,
//         ),
//         title: "Gift Ideas",
//         id: '',
//       ),
//       CategoryModel(
//         iconsName: const Icon(Icons.shopping_bag, color: Colors.blue, size: 32),
//         title: "Clothing",
//         id: '',
//       ),
//     ];
//   }
// }
