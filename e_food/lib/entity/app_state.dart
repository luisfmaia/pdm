import 'package:e_food/entity/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  late User user;
  List<Product> basket = [];

  setUser(User user) {
    this.user = user;
  }

  addProduct(Product product) {
    basket.add(product);
  }

  removeProduct(int pos) {
    basket.removeAt(pos);
    notifyListeners();
  }
}
