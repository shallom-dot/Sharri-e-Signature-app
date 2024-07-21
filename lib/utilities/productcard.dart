import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharries_signature/Provider/wishlistprovider.dart';

import '../models/wishlist _model.dart';

class ProductCard extends StatelessWidget {
  final String text;
  final String price;
  final String url;
  final String heroTag;
  final VoidCallback onTap;
  final VoidCallback addToCart;

  const ProductCard({
    super.key,
    required this.text,
    required this.price,
    required this.url,
    required this.heroTag,
    required this.onTap,
    required this.addToCart, required Null Function() addToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    final item = WishlistItem(
      name: text,
      imageUrl: url,
      price: double.parse(price.substring(1)),
    );

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: heroTag,
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 140,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      wishlistProvider.isInWishlist(item)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,

                    ),
                    onPressed: () {
                      if (wishlistProvider.isInWishlist(item)) {
                        wishlistProvider.removeFromWishlist(item);
                      } else {
                        wishlistProvider.addToWishlist(item);
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60,

                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          text,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: addToCart,
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.green, width: 1),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 10, height: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}