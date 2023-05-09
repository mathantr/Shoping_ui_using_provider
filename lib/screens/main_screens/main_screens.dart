// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shops/screens/main_screens/favorite_screen.dart';
import 'package:shoes_shops/screens/main_screens/cart_screen.dart';

import '/controllers/main_screen_provider.dart';

import '/screens/main_screens/home_screen.dart';
import '/screens/main_screens/profile_screen.dart';
import '/screens/main_screens/search.dart';

import '../bottom_screens/bottom_navigator_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomeScreen(),
    Search(),
    FavoriteScreen(),
    CartPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return Scaffold(
          body: pageList[mainScreenProvider.pageIndex],
          bottomNavigationBar: BottomNavigatorScreen(),
        );
      },
    );
  }
}
