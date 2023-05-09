import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:provider/provider.dart';
import 'package:shoes_shops/controllers/favorite_provider.dart';
import 'package:shoes_shops/screens/main_screens/main_screens.dart';
import '/constants/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var favoriteNotifier = Provider.of<FavoritesNotifiers>(context);
    favoriteNotifier.getAllData();
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 16,
              top: 46,
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/top1.jpeg',
                    ),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Favorite Items',
                style: header.copyWith(
                  color: white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: favoriteNotifier.fav.length,
              padding: EdgeInsets.only(top: 100),
              itemBuilder: (context, index) {
                final sheo = favoriteNotifier.fav[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: liteWhite,
                        border: Border.all(width: 3, color: liteGreen),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: sheo['imageUrl'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sheo['name'],
                                      style: textFont.copyWith(
                                          color: black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      sheo['category'],
                                      style: textFont.copyWith(
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${sheo['price']}',
                                          style: textFont.copyWith(
                                              color: black,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                favoriteNotifier.deleteFav(sheo['key']);
                                favoriteNotifier.ids.removeWhere(
                                    (element) => element == sheo['id']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreen(),
                                    ));
                              },
                              child: Icon(
                                Ionicons.md_heart_dislike,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
