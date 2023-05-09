import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:provider/provider.dart';
import 'package:shoes_shops/controllers/cart_provider.dart';
import 'package:shoes_shops/screens/cart_checkout_btn/cart_checkout_btn.dart';
import 'package:shoes_shops/screens/main_screens/main_screens.dart';

import '../../constants/constants.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    AntDesign.close,
                    color: Colors.black,
                  ),
                ),
                Text("My Cart",
                    style: textFont.copyWith(
                      color: black.withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                      itemCount: cartProvider.cart.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = cartProvider.cart[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: doNothing,
                                    backgroundColor: liteGreen,
                                    foregroundColor: white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: liteWhite, boxShadow: [
                                  BoxShadow(
                                      color: white,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1)),
                                ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['name'],
                                                style: textFont.copyWith(
                                                  color: black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data['category'],
                                                style: textFont.copyWith(
                                                  color: black.withOpacity(0.9),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text('\$${data['price']}',
                                                      style: textFont.copyWith(
                                                        color: black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                  const SizedBox(
                                                    width: 40,
                                                  ),
                                                  Text("Size",
                                                      style: textFont.copyWith(
                                                        color: black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(data['sizes'],
                                                      style: textFont.copyWith(
                                                        color: black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartProvider.deleteCart(
                                                            data['key']);
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MainScreen(),
                                                            ));
                                                      },
                                                      child: Icon(Icons.delete))
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      cartProvider.decreament();
                                                    },
                                                    child: const Icon(
                                                      AntDesign.minussquare,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    )),
                                                Text(data['qty'].toString(),
                                                    style: textFont.copyWith(
                                                      color: black
                                                          .withOpacity(0.4),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      cartProvider.increament();
                                                    },
                                                    child: const Icon(
                                                      AntDesign.plussquare,
                                                      size: 20,
                                                      color: Colors.black,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
