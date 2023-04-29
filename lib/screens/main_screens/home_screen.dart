import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

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
                  image: AssetImage('assets/images/top_image.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 20),
                width: MediaQuery.of(context).size.width,
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
                    TabBar(
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
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.yellow,
                              height: size.height,
                              width: size.width * 0.6,
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Latest Shoes',
                                  style: header.copyWith(
                                      color: black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'See More',
                                      style: header.copyWith(
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 32,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: liteGreen,
                                  borderRadius: BorderRadius.circular(15)),
                              height: size.height,
                              width: size.width * 0.6,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      'https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        color: Colors.orange,
                      ),
                    ],
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
