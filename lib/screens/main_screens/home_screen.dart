import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shops/controllers/product_provider.dart';

import '/constants/constants.dart';
import 'home_screen_widgets/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getMale();
    productProvider.getWomen();
    productProvider.getKids();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, top: 46),
              height: MediaQuery.of(context).size.height * 0.46,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top1.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 20),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Style',
                      style: header.copyWith(
                        color: white,
                        fontSize: 42,
                      ),
                    ),
                    Text(
                      'Shoe Store\'s',
                      style: header.copyWith(
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
                        indicatorColor: Colors.amber,
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: white,
                        labelStyle: header.copyWith(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2),
                        unselectedLabelColor: liteWhite,
                        tabs: [
                          Tab(text: 'Men Shoes'),
                          Tab(text: 'Women Shoes'),
                          Tab(text: 'Kid Shoes'),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.245),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: TabBarView(controller: _tabController, children: [
                  HomeWidget(
                    male: productProvider.male,
                    tabIndex: 0,
                  ),
                  HomeWidget(
                    male: productProvider.female,
                    tabIndex: 1,
                  ),
                  HomeWidget(
                    male: productProvider.kids,
                    tabIndex: 2,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
