import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'CartScreen',
          style: header.copyWith(fontSize: 33),
        ),
      ),
    );
  }
}
