import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ProfileScreen',
          style: header.copyWith(fontSize: 33),
        ),
      ),
    );
  }
}
