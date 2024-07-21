import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final double price;
  final String img;

  Product({required this.name, required this.price,required this.img});
}

class Cart with ChangeNotifier {
  List<Product> _items = [];
  double _totalPrice = 0.0;

  List<Product> get items => _items;
  double get totalPrice => _totalPrice;

  void addItem(Product product) {
    _items.add(product);
    _totalPrice += product.price;


    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    _totalPrice -= product.price;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }
}
