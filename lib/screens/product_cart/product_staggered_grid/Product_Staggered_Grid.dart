import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/mens_model.dart';
import '../product_cart_stagger/product_cart_stagger.dart';

class ProductListStaggeredGrid extends StatelessWidget {
  const ProductListStaggeredGrid({
    super.key,
    required Future<List<MenModel>> male,
  }) : _male = male;

  final Future<List<MenModel>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenModel>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error ${snapshot.hasError}');
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              itemCount: male!.length,
              scrollDirection: Axis.vertical,
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? MediaQuery.of(context).size.height * 0.35
                      : MediaQuery.of(context).size.height * 0.3),
              itemBuilder: (context, index) {
                final shoe = snapshot.data![index];
                return ProductCartStagger(
                    image: shoe.imageUrl[1],
                    name: shoe.name,
                    price: "\$${shoe.price}");
              });
        }
      },
    );
  }
}
