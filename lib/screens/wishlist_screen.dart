import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharries_signature/Provider/wishlistprovider.dart'; // Import WishlistProvider

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistProvider.wishlist.length,
        itemBuilder: (context, index) {
          final item = wishlistProvider.wishlist[index];
          
          return ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.name),
            subtitle: Text('\$${item.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () {
                wishlistProvider.removeFromWishlist(item);
              },
            ),
          );
        },
      ),
    );
  }
}
