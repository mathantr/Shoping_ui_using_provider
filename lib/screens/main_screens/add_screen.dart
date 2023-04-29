import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'AddScreen',
          style: header.copyWith(fontSize: 33),
        ),
      ),
    );
  }
}
