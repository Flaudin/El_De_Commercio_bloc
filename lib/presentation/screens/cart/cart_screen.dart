import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/presentation/screens/cart/components/cart_card.dart';
import 'package:tracking_app/utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock data - replace with your actual data model later
  final List<Map<String, dynamic>> cartItems = [
    {
      'productName': 'NIKE Run Swift 2',
      'color': 'Red',
      'size': '42',
      'price': 126.99,
      'quantity': 2,
    },
    {
      'productName': 'Nike Air Presto',
      'color': 'Green',
      'size': '42',
      'price': 132.99,
      'quantity': 3,
    },
    {
      'productName': 'NIKE Run Swift 2',
      'color': 'Pink',
      'size': '42',
      'price': 126.99,
      'quantity': 1,
    },
    {
      'productName': 'Adidas Yung-1',
      'color': 'Red',
      'size': '42',
      'price': 118.99,
      'quantity': 1,
    },
  ];

  double get totalAmount {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  void _updateQuantity(int index, int change) {
    setState(() {
      final newQuantity = cartItems[index]['quantity'] + change;
      if (newQuantity >= 1) {
        cartItems[index]['quantity'] = newQuantity;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGTertiaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80.h,
        titleSpacing: 12.w,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: kBlackColor),
          ),
        ],
      ),
      body:
          cartItems.isEmpty
              ? Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
              )
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: CartCard(
                        productName: item['productName'],
                        color: item['color'],
                        size: item['size'],
                        price: item['price'],
                        quantity: item['quantity'],
                        onDelete: () => _removeItem(index),
                        onDecrement: () => _updateQuantity(index, -1),
                        onIncrement: () => _updateQuantity(index, 1),
                      ),
                    );
                  },
                ),
              ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: kTextColorPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SafeArea(
          child: Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${totalAmount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: kTextColorPrimary,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: kTextColorPrimary,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward,
                    color: kTextColorPrimary,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
