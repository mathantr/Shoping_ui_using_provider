// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '/constants/constants.dart';
import '/controllers/favorite_provider.dart';
import '/controllers/product_provider.dart';
import '/screens/main_screens/favorite_screen.dart';

import '../../models/mens_model.dart';
import '../../services/helpers.dart';
import '../add_tag_btn/add_tag_btn.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.category,
  }) : super(key: key);
  final String id;
  final String category;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController pageController = PageController();
  final _cartBox = Hive.box('cart_box');
  // final _favBox = Hive.box('fav_box');

  late Future<MenModel> _sneaker;

  void getShoes() {
    if (widget.category == "Men's Running") {
      _sneaker = Helper().getMenModelsId(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneaker = Helper().getFemaleModelsId(widget.id);
    } else {
      _sneaker = Helper().getKidsModelsId(widget.id);
    }
  }

  Future<void> _createCart(Map<dynamic, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteNotifier =
        Provider.of<FavoritesNotifiers>(context, listen: true);

    favoriteNotifier.getFavorites();
    return Scaffold(
        body: FutureBuilder<MenModel>(
            future: _sneaker,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final sneaker = snapshot.data;
                return Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leadingWidth: 0,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    CupertinoIcons.multiply,
                                    color: white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    productProvider.shoeSizes.clear();
                                  },
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          pinned: true,
                          snap: false,
                          floating: true,
                          backgroundColor: Colors.transparent,
                          expandedHeight: MediaQuery.of(context).size.height,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .50,
                                  width: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sneaker!.imageUrl.length,
                                    controller: pageController,
                                    onPageChanged: (page) {
                                      productProvider.activePage = page;
                                    },
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.39,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.grey,
                                            child: CachedNetworkImage(
                                              imageUrl: sneaker.imageUrl[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.11,
                                              right: 25,
                                              child:
                                                  Consumer<FavoritesNotifiers>(
                                                builder: (context,
                                                    favoriteNotifiers, child) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      if (favoriteNotifiers.ids
                                                          .contains(
                                                              widget.id)) {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FavoriteScreen(),
                                                            ));
                                                      } else {
                                                        favoriteNotifier
                                                            .createFav({
                                                          "id": sneaker.id,
                                                          "name": sneaker.name,
                                                          "category":
                                                              sneaker.category,
                                                          "price":
                                                              sneaker.price,
                                                          "imageUrl": sneaker
                                                              .imageUrl[0],
                                                        });
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: favoriteNotifiers.ids
                                                            .contains(
                                                                sneaker.id)
                                                        ? Icon(
                                                            CupertinoIcons
                                                                .heart_fill,
                                                            size: 30,
                                                            color: Colors.red,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .heart,
                                                            size: 30,
                                                            color: black
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                  );
                                                },
                                              )),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List<Widget>.generate(
                                                    sneaker.imageUrl.length,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 4.0,
                                                                  horizontal:
                                                                      5),
                                                          child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                productProvider
                                                                            .activePage !=
                                                                        index
                                                                    ? liteGreen
                                                                    : liteWhite,
                                                          ),
                                                        )),
                                              )),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                    bottom: 45,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.645,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(sneaker.name,
                                                  style: textFont.copyWith(
                                                      color: black,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Row(
                                                children: [
                                                  Text(
                                                    sneaker.category,
                                                    style: textFont.copyWith(
                                                        color: black
                                                            .withOpacity(0.4),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: 4,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 22,
                                                    itemPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 1),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      size: 18,
                                                      color: Colors.black,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$${sneaker.price}",
                                                    style: textFont.copyWith(
                                                        color: black,
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Colors",
                                                        style:
                                                            textFont.copyWith(
                                                                color: black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                            Colors.red,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Select sizes",
                                                        style:
                                                            textFont.copyWith(
                                                                color: black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        "View size guide",
                                                        style: textFont.copyWith(
                                                            color: black
                                                                .withOpacity(
                                                                    0.4),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                    child: ListView.builder(
                                                        itemCount:
                                                            productProvider
                                                                .shoeSizes
                                                                .length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final sizes =
                                                              productProvider
                                                                      .shoeSizes[
                                                                  index];

                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 8.0,
                                                            ),
                                                            child: ChoiceChip(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                  side: const BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                      style: BorderStyle
                                                                          .solid)),
                                                              disabledColor:
                                                                  Colors.white,
                                                              label: Text(
                                                                  sizes['size'],
                                                                  style: textFont.copyWith(
                                                                      color: sizes[
                                                                              'isSelected']
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                              selectedColor:
                                                                  Colors.black,
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          8),
                                                              selected: sizes[
                                                                  'isSelected'],
                                                              onSelected:
                                                                  (newState) {
                                                                if (productProvider
                                                                    .sizes
                                                                    .contains(sizes[
                                                                        'size'])) {
                                                                  productProvider
                                                                      .sizes
                                                                      .remove(sizes[
                                                                          'size']);
                                                                } else {
                                                                  productProvider
                                                                      .sizes
                                                                      .add(sizes[
                                                                          'size']);
                                                                }
                                                                print(
                                                                    productProvider
                                                                        .sizes);
                                                                productProvider
                                                                    .toggleCheck(
                                                                        index);
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                indent: 10,
                                                endIndent: 10,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Text(sneaker.title,
                                                    maxLines: 2,
                                                    style: textFont.copyWith(
                                                        color: black,
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                sneaker.description,
                                                textAlign: TextAlign.justify,
                                                maxLines: 4,
                                                style: textFont.copyWith(
                                                    color: black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12),
                                                  child: AddTagBtn(
                                                    onTap: () async {
                                                      _createCart({
                                                        "id": sneaker.id,
                                                        "name": sneaker.name,
                                                        "category":
                                                            sneaker.category,
                                                        "sizes": productProvider
                                                            .sizes[0],
                                                        "imageUrl":
                                                            sneaker.imageUrl[0],
                                                        "price": sneaker.price,
                                                        "qty": 1
                                                      });
                                                      print(sneaker.name);
                                                      productProvider.sizes
                                                          .clear();
                                                      Navigator.pop(context);
                                                    },
                                                    name: "Add to Cart",
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              }
            }));
  }
}
