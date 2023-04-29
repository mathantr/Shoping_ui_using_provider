import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: header.copyWith(fontSize: 33),
        ),
      ),
    );
  }
}
