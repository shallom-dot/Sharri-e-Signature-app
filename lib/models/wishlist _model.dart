import 'package:flutter/material.dart';

class WishlistItem {
  final String name;
  final String imageUrl;
  final double price;

  WishlistItem({required this.name, required this.imageUrl, required this.price});
}

class WishlistModel extends ChangeNotifier {
  final List<WishlistItem> _items = [];

  List<WishlistItem> get items => _items;

  void addItem(WishlistItem item) {
    if (!_items.contains(item)) {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeItem(WishlistItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
