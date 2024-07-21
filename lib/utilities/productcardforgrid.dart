import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharries_signature/Provider/wishlistprovider.dart';

import '../models/wishlist _model.dart'; // Ensure this import is correct

class ProductCardForGrid extends StatelessWidget {
  final String text;
  final String price;
  final String imageUrl;
  final String heroTag;
  final VoidCallback onTap;
  final VoidCallback addToCart;

  const ProductCardForGrid({
    Key? key,
    required this.text,
    required this.price,
    required this.imageUrl,
    required this.heroTag,
    required this.onTap,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the WishlistProvider from the context
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // Create a WishlistItem from the product details
    final item = WishlistItem(
      name: text,
      imageUrl: imageUrl,
      price: double.parse(price.substring(1)), // Remove '$' and parse the price
    );

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
          tag: heroTag,
          child: Container(
            width: 180,
            height: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 160,
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
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80,
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
        ),
      ),
    );
  }
}
