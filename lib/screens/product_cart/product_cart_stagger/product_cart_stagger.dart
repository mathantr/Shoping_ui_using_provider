// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shoes_shops/constants/constants.dart';

class ProductCartStagger extends StatefulWidget {
  const ProductCartStagger({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);
  final String image, name, price;

  @override
  State<ProductCartStagger> createState() => _ProductCartStaggerState();
}

class _ProductCartStaggerState extends State<ProductCartStagger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          border: Border.all(color: liteGreen, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.image,
              fit: BoxFit.fill,
              height: 155,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textFont.copyWith(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        height: 1.5),
                  ),
                  Text(
                    widget.price,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textFont.copyWith(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
