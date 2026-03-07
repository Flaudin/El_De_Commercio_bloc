import 'package:flutter/material.dart';

IconData getIcon(String iconName) {
  switch (iconName) {
    case 'Electronics & Tech':
      return Icons.devices;
    case 'Health & Wellness':
      return Icons.fitness_center;
    case 'Jewelry & Accessories':
      return Icons.diamond;
    case 'Home & Kitchen':
      return Icons.kitchen;
    case 'Books & Media':
      return Icons.book;
    case 'Toys & Games':
      return Icons.toys;
    case 'Smart Home Devices':
      return Icons.smartphone;
    case 'Grocery & Gourmet':
      return Icons.local_grocery_store;
    case 'Home Decor & Furniture':
      return Icons.home;
    case 'Automotive & Tools':
      return Icons.directions_car;
    case 'Pet Supplies':
      return Icons.pets;
    case 'Garden & Outdoor Living':
      return Icons.local_florist;
    case 'Sports & Outdoors':
      return Icons.sports_basketball;
    case 'Baby & Kids':
      return Icons.child_care;
    case 'Sustainable & Eco-friendly':
      return Icons.shopping_basket;
    case 'Office & School Supplies':
      return Icons.edit;
    case 'Gifts & Special Occasions':
      return Icons.card_giftcard;
    case 'Fashion & Apparel':
      return Icons.shopping_bag;
    default:
      return Icons.category;
  }
}

Color getIconColor(String title) {
  switch (title) {
    case 'Electronics & Tech':
      return Colors.green;
    case 'Health & Wellness':
      return Colors.red;
    case 'Smart Home Devices':
      return Colors.indigo;
    case 'Jewelry & Accessories':
      return Colors.purple;
    case 'Home & Kitchen':
      return Colors.orange;
    case 'Books & Media':
      return Colors.teal;
    case 'Toys & Games':
      return Colors.pink;
    case 'Grocery & Gourmet':
      return Colors.deepOrange;
    case 'Home Decor & Furniture':
      return Colors.lightBlue;
    case 'Automotive & Tools':
      return Colors.redAccent;
    case 'Pet Supplies':
      return Colors.brown;
    case 'Garden & Outdoor Living':
      return Colors.lightGreenAccent;
    case 'Sports & Outdoors':
      return Colors.deepPurple;
    case 'Baby & Kids':
      return Colors.amber;
    default:
      return Colors.grey;
  }
}
