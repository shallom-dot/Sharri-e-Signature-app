import 'package:flutter/material.dart';

import '../models/wishlist _model.dart';

class WishlistProvider with ChangeNotifier {
  final WishlistModel _wishlistModel = WishlistModel();

  List<WishlistItem> get wishlist => _wishlistModel.items;

  void addToWishlist(WishlistItem item) {
    if (!_wishlistModel.items.contains(item)) {
      _wishlistModel.addItem(item);
      notifyListeners();
    }
  }

  void removeFromWishlist(WishlistItem item) {
    if (_wishlistModel.items.contains(item)) {
      _wishlistModel.removeItem(item);
      notifyListeners();
    }
  }

  bool isInWishlist(WishlistItem item) {
    return _wishlistModel.items.contains(item);
  }
}
