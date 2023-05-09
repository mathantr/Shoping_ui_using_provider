import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/main_screen_provider.dart';

import '../../constants/constants.dart';
import 'bottom_navigator.dart';

class BottomNavigatorScreen extends StatelessWidget {
  const BottomNavigatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationIcons(
                  icon: mainScreenProvider.pageIndex == 0
                      ? CommunityMaterialIcons.home
                      : Icons.home_outlined,
                  onTap: () {
                    mainScreenProvider.pageIndex = 0;
                  },
                ),
                BottomNavigationIcons(
                  icon: mainScreenProvider.pageIndex == 1
                      ? CommunityMaterialIcons.select_search
                      : Icons.search,
                  onTap: () {
                    mainScreenProvider.pageIndex = 1;
                  },
                ),
                BottomNavigationIcons(
                  icon: mainScreenProvider.pageIndex == 2
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  onTap: () {
                    mainScreenProvider.pageIndex = 2;
                  },
                ),
                BottomNavigationIcons(
                  icon: mainScreenProvider.pageIndex == 3
                      ? CommunityMaterialIcons.cart
                      : CommunityMaterialIcons.cart_outline,
                  onTap: () {
                    mainScreenProvider.pageIndex = 3;
                  },
                ),
                BottomNavigationIcons(
                  icon: mainScreenProvider.pageIndex == 4
                      ? Icons.person
                      : Icons.person_outline,
                  onTap: () {
                    mainScreenProvider.pageIndex = 4;
                  },
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
