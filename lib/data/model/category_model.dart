import 'package:flutter/material.dart';

class CategoryModel {
  Icon icons;
  String title;
  CategoryModel({required this.icons, required this.title});
}

class CategoryData {
  static List<CategoryModel> sampleCategory() {
    return [
      CategoryModel(
        icons: const Icon(Icons.devices, color: Colors.green, size: 32),
        title: "Electronics",
      ),
      CategoryModel(
        icons: const Icon(Icons.chair, color: Colors.brown, size: 32),
        title: "Furniture",
      ),
      CategoryModel(
        icons: const Icon(Icons.fitness_center, color: Colors.red, size: 32),
        title: "Sports",
      ),
      CategoryModel(
        icons: const Icon(Icons.diamond, color: Colors.purple, size: 32),
        title: "Jewelry",
      ),
      CategoryModel(
        icons: const Icon(Icons.kitchen, color: Colors.orange, size: 32),
        title: "Kitchen",
      ),
      CategoryModel(
        icons: const Icon(Icons.book, color: Colors.teal, size: 32),
        title: "Books",
      ),
      CategoryModel(
        icons: const Icon(Icons.toys, color: Colors.pink, size: 32),
        title: "Toys",
      ),
      CategoryModel(
        icons: const Icon(Icons.spa, color: Colors.lightGreen, size: 32),
        title: "Beauty",
      ),
      CategoryModel(
        icons: const Icon(Icons.smartphone, color: Colors.indigo, size: 32),
        title: "Phones",
      ),
      CategoryModel(
        icons: const Icon(Icons.watch, color: Colors.amber, size: 32),
        title: "Watches",
      ),
      CategoryModel(
        icons: const Icon(
          Icons.local_grocery_store,
          color: Colors.deepOrange,
          size: 32,
        ),
        title: "Groceries",
      ),
      CategoryModel(
        icons: const Icon(Icons.home, color: Colors.lightBlue, size: 32),
        title: "Home Decor",
      ),
      CategoryModel(
        icons: const Icon(Icons.headphones, color: Colors.grey, size: 32),
        title: "Audio",
      ),
      CategoryModel(
        icons: const Icon(Icons.computer, color: Colors.blueGrey, size: 32),
        title: "Computers",
      ),
      CategoryModel(
        icons: const Icon(Icons.directions_car, color: Colors.red, size: 32),
        title: "Automotive",
      ),
      CategoryModel(
        icons: const Icon(Icons.pets, color: Colors.brown, size: 32),
        title: "Pet Supplies",
      ),
      CategoryModel(
        icons: const Icon(Icons.local_florist, color: Colors.pink, size: 32),
        title: "Garden",
      ),
      CategoryModel(
        icons: const Icon(
          Icons.sports_basketball,
          color: Colors.orange,
          size: 32,
        ),
        title: "Sports Gear",
      ),
      CategoryModel(
        icons: const Icon(
          Icons.videogame_asset,
          color: Colors.deepPurple,
          size: 32,
        ),
        title: "Gaming",
      ),
      CategoryModel(
        icons: const Icon(Icons.child_care, color: Colors.cyan, size: 32),
        title: "Baby",
      ),
      CategoryModel(
        icons: const Icon(Icons.shopping_basket, color: Colors.amber, size: 32),
        title: "Handmade",
      ),
      CategoryModel(
        icons: const Icon(Icons.camera_alt, color: Colors.black, size: 32),
        title: "Cameras",
      ),
      CategoryModel(
        icons: const Icon(
          Icons.card_giftcard,
          color: Colors.redAccent,
          size: 32,
        ),
        title: "Gift Ideas",
      ),
      CategoryModel(
        icons: const Icon(Icons.shopping_bag, color: Colors.blue, size: 32),
        title: "Clothing",
      ),
    ];
  }
}
