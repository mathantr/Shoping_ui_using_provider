// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shops/controllers/main_screen_provider.dart';
import 'package:shoe_shops/screens/main_screens/add_screen.dart';
import 'package:shoe_shops/screens/main_screens/cart_screen.dart';
import 'package:shoe_shops/screens/main_screens/home_screen.dart';
import 'package:shoe_shops/screens/main_screens/profile_screen.dart';
import 'package:shoe_shops/screens/main_screens/search.dart';

import '../bottom_screens/bottom_navigator_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomeScreen(),
    Search(),
    AddScreen(),
    CartScreen(),
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
