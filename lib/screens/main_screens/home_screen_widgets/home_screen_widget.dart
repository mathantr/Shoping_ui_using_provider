import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shops/controllers/product_provider.dart';
import 'package:shoes_shops/screens/product_cart/product_cart.dart';
import 'package:shoes_shops/screens/product_detail_screen/product_detail_screen.dart';

import '../../../constants/constants.dart';
import '../../../models/mens_model.dart';
import '../../product_card/product_card.dart';
import '../main_screen_widgets/list_shoes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.tabIndex,
    required Future<List<MenModel>> male,
  }) : _male = male;

  final Future<List<MenModel>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: FutureBuilder<List<MenModel>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.hasError}');
                  } else {
                    final male = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            productProvider.shoesSizes = shoe.sizes;
                            print(productProvider.shoeSizes);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      id: shoe.id, category: shoe.category),
                                ));
                          },
                          child: ProductCard(
                              price: '\$${shoe.price}',
                              category: shoe.category,
                              id: shoe.id,
                              name: shoe.name,
                              image: shoe.imageUrl[1]),
                        );
                      },
                    );
                  }
                },
              )),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductCart(
                                tabIndex: tabIndex,
                              ),
                            ));
                      },
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: FutureBuilder<List<MenModel>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.hasError}');
                  } else {
                    final male = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return LatestShoes(
                          imageUrl: shoe.imageUrl[0],
                        );
                      },
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
