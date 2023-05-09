// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoes_shops/constants/constants.dart';
import 'package:shoes_shops/screens/category_btn/category_btn.dart';
import 'package:shoes_shops/screens/custom_spacer/custom_spacer.dart';

import '../../models/mens_model.dart';
import '../../services/helpers.dart';
import 'product_staggered_grid/Product_Staggered_Grid.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);
  final int tabIndex;
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<MenModel>> _male;
  late Future<List<MenModel>> _female;
  late Future<List<MenModel>> _kids;

  void getMale() {
    _male = Helper().getMenModels();
  }

  void getWomen() {
    _female = Helper().getFemaleModels();
  }

  void getKids() {
    _kids = Helper().getKidsModels();
  }

  @override
  void initState() {
    getMale();
    getWomen();
    getKids();
    super.initState();
  }

  List<String> brand = [
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/jordan.png',
    'assets/images/nike.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, top: 45),
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/top1.jpeg'),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.close,
                              color: white,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              AntDesign.sharealt,
                              color: white,
                              size: 25,
                            ),
                            onPressed: () {
                              filter();
                            }),
                      ],
                    ),
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
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: TabBarView(controller: _tabController, children: [
                  ProductListStaggeredGrid(male: _male),
                  ProductListStaggeredGrid(male: _female),
                  ProductListStaggeredGrid(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: BoxDecoration(
          color: liteWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: liteGreen),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  CustomSpacer(),
                  Text(
                    'Filter',
                    style: header.copyWith(
                        color: black,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomSpacer(),
                  Text(
                    'Gender',
                    style: header.copyWith(
                      color: black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Male',
                        onTap: () {},
                      ),
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Female',
                        onTap: () {},
                      ),
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Kids',
                        onTap: () {},
                      ),
                    ],
                  ),
                  CustomSpacer(),
                  Text(
                    'Category',
                    style: header.copyWith(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  CustomSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Shoes',
                        onTap: () {},
                      ),
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Apparrels',
                        onTap: () {},
                      ),
                      CategoryBtn(
                        bottonClr: black,
                        title: 'Accessories',
                        onTap: () {},
                      ),
                    ],
                  ),
                  CustomSpacer(),
                  Text(
                    'Price',
                    style: header.copyWith(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomSpacer(),
                  Slider(
                      value: _value,
                      activeColor: liteGreen,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      secondaryActiveColor: black,
                      onChanged: (double value) {}),
                  CustomSpacer(),
                  Text(
                    'Brand',
                    style: header.copyWith(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 65,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              brand[index],
                              height: 60,
                              width: 80,
                              color: black,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
