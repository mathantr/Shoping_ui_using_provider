import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class CartProvider extends ChangeNotifier {
  final _cartBox = Hive.box('cart_box');
  List<dynamic> _cart = [];

  List<dynamic> get cart => _cart;

  set cart(List<dynamic> newcart) {
    _cart = newcart;
    notifyListeners();
  }

  getCart() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    _cart = cartData.reversed.toList();
  }

  Future<void> deleteCart(int key) async {
    await _cartBox.delete(key);
  }

  int _counter = 0;

  int get counter => _counter;

  void increament() {
    _counter++;
    notifyListeners();
  }

  void decreament() {
    if (_counter >= 1) ;
    _counter--;
    notifyListeners();
  }
}
