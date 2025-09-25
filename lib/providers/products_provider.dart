import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _androidItems = andoridProducts;
  final List<Product> _iphoneItems = iphoneProducts;

  bool showAndroid = true;
  bool showIphone = true;

  final List<Product> _selectedItems = [];

  List<Product> get items {
    if (showAndroid && showIphone) {
      return [..._androidItems, ..._iphoneItems];
    } else if (showAndroid) {
      return [..._androidItems];
    } else if (showIphone) {
      return [..._iphoneItems];
    } else {
      return [];
    }
  }

  List<Product> get selectedItems => [..._selectedItems];

  void toggleAndroid() {
    showAndroid = !showAndroid;
    notifyListeners();
  }

  void toggleIphone() {
    showIphone = !showIphone;
    notifyListeners();
  }

  void toggleSelect(Product product) {
    if (_selectedItems.contains(product)) {
      _selectedItems.remove(product);
    } else {
      _selectedItems.add(product);
    }
    notifyListeners();
  }
}
