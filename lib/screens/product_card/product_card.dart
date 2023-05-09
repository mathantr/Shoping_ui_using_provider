// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoes_shops/controllers/favorite_provider.dart';
import 'package:shoes_shops/screens/main_screens/favorite_screen.dart';

import '/constants/constants.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.price,
    required this.category,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // final _favBox = Hive.box('fav_box');

  @override
  Widget build(BuildContext context) {
    var favoriteNotifier =
        Provider.of<FavoritesNotifiers>(context, listen: true);
    favoriteNotifier.getFavorites();
    bool selected = true;
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: liteWhite, width: 3.0)),
        height: size.height,
        width: size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(widget.image))),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (favoriteNotifier.ids.contains(widget.id)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoriteScreen(),
                            ));
                      } else {
                        favoriteNotifier.createFav({
                          "id": widget.id,
                          "name": widget.name,
                          "category": widget.category,
                          "price": widget.price,
                          "imageUrl": widget.image,
                        });
                      }
                      setState(() {});
                    },
                    child: favoriteNotifier.ids.contains(widget.id)
                        ? Icon(
                            CupertinoIcons.heart_fill,
                            size: 30,
                            color: Colors.red,
                          )
                        : Icon(
                            CupertinoIcons.heart,
                            size: 30,
                            color: black.withOpacity(0.5),
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textFont.copyWith(
                        color: black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.1),
                  ),
                  Text(
                    widget.category,
                    style: textFont.copyWith(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price,
                    style: textFont.copyWith(
                      color: black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Colors',
                        style: textFont.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ChoiceChip(
                        label: Text(''),
                        selected: selected,
                        visualDensity: VisualDensity.compact,
                        selectedColor: Colors.black,
                      ),
                    ],
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
