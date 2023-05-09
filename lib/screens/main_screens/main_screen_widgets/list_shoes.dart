// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: liteGreen, borderRadius: BorderRadius.circular(15)),
      height: size.height,
      width: size.width * 0.6,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
