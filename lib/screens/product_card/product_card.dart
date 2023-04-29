import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoe_shops/constants/constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: size.height,
        width: size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.23,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(url))),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(CupertinoIcons.heart),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nike',
                  style: textFont.copyWith(
                      fontSize: 36, fontWeight: FontWeight.w800, height: 1.1),
                ),
                Text(
                  'Mens Running',
                  style: textFont.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: black.withOpacity(0.5),
                      height: 1.1),
                ),
                Row(
                  children: [
                    Text(
                      '\$ 5.5',
                      style: textFont.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Color',
                          style: textFont.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
