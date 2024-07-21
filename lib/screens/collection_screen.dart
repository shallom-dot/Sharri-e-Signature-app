// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:provider/provider.dart';
// import 'package:sharries_signature/models/api_model.dart';
// import 'package:sharries_signature/models/cartmodel.dart';
// import 'package:sharries_signature/models/product_model.dart';
// import 'package:sharries_signature/screens/cart_screen.dart';
// import 'package:sharries_signature/screens/cartwithsomething.dart';
// import 'package:sharries_signature/screens/checkoutscreen.dart';
// import 'package:sharries_signature/screens/productdetails.dart';
// import 'package:sharries_signature/utilities/image_textcard.dart';
// import 'package:sharries_signature/utilities/productcard.dart';
// import 'package:sharries_signature/utilities/reusable_underline.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sharries_signature/services/product_services.dart';

// import '../models/wishlist _model.dart'; // Adjust the import based on your project structure

// class CollectionScreen extends StatefulWidget {
//   const CollectionScreen({super.key});

//   @override
//   _CollectionScreenState createState() => _CollectionScreenState();
// }

// class _CollectionScreenState extends State<CollectionScreen> {
//   final List cartItems = []; // Initialize cartItems
//   List<Product> _products = [];
//   bool _isLoading = true;
//   String _category = 'default_category'; // Define your default category here

//   final apiUrl = dotenv.env['API_URL'];
//   final apiKey = dotenv.env['API_KEY'];
//   final organizationId = dotenv.env['ORGANIZATION_ID'];
//   final appId = dotenv.env['APP_ID'];
//   final apiImageUrl = dotenv.env['API_IMAGE_URL'];

//   @override
//   void initState() {
//     super.initState();
//     _fetchProductsByCategory(_category);
//   }

//   Future<void> _fetchProductsByCategory(String category) async {
//     ProductServices productServices = ProductServices(
//       apiUrl: apiUrl!,
//       apiKey: apiKey!,
//       organizationId: organizationId!,
//       appId: appId!,
//     );

//     try {
//       Api apiData = await productServices.getProductsByCategory(category);
//       setState(() {
//         _products = apiData.items;
//         _isLoading = false;
//       });
//     } catch (e) {
//       print(e);
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               'Sharries Signature',
//               style: GoogleFonts.redressed(
//                 fontSize: 24,
//                 color: const Color(0XFF408C2B),
//               ),
//             ),
//           ],
//         ),
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.history),
//             onPressed: () {
//               // Navigate to Order History screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: const ImageIcon(
//               AssetImage('assets/images/icons8-shopping-cart-48.png'),
//             ),
//             onPressed: () {
//               if (cartItems.isNotEmpty) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CartScreen()),
//                 );
//               } else {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EmptyCartScreen()),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 32),
//                     _buildWelcomeText(),
//                     const SizedBox(height: 15),
//                     _buildSearchField(context),
//                     const SizedBox(height: 20),
//                     _buildJustForYou(context),
//                     const SizedBox(height: 20),
//                     _buildHorizontalProductList(context),
//                     const SizedBox(height: 40),
//                     _buildDealsText(),
//                     const SizedBox(height: 20),
//                     _buildGridProducts(context),
//                     const SizedBox(height: 50),
//                     _buildOurCollectionsText(),
//                     const SizedBox(height: 50),
//                     _buildImageTextCards(),
//                     const SizedBox(height: 50),
//                     _buildYouMightLikeText(),
//                     const SizedBox(height: 50),
//                     _buildSecondProducts(context),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildWelcomeText() {
//     return Text(
//       'Welcome, Jane',
//       style: GoogleFonts.poppins(
//         fontSize: 16,
//         height: 1.5,
//       ),
//     );
//   }

//   Widget _buildSearchField(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       height: 60,
//       width: MediaQuery.of(context).size.width / 1.1,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.black),
//       ),
//       child: TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.search,
//             size: 20,
//             color: Colors.black,
//           ),
//           border: InputBorder.none,
//           labelText: 'Search',
//           labelStyle: GoogleFonts.inter(
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildJustForYou(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'Just for you',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//         ),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.chevron_left),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.chevron_right),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHorizontalProductList(BuildContext context) {
//     return SizedBox(
//       height: 210,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: _products.map((product) {
//           String imageUrl = apiImageUrl! + product.productImage!;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: ProductCard(
//               text: product.name,
//               price: product.sellingPrice.toString(),
//               url: imageUrl,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetails(
//                       heroTag: 'Listproduct${product.name}',
//                       url: imageUrl,
//                       origin: 'list',
//                       productName: product.name,
//                     ),
//                   ),
//                 );
//               },
//               heroTag: 'Listproduct${product.name}',
//               addToCart: () {
//                 Provider.of<CartModel>(context, listen: false).addItem(
//                   CartItem(
//                     name: product.name,
//                     imageUrl: imageUrl,
//                     price: product.sellingPrice,
//                   ),
//                 );
//                 setState(() {
//                   cartItems.add(product); // Add to cartItems list
//                 });
//               },
//               addToWishlist: () {
//                 Provider.of<WishlistModel>(context, listen: false).addItem(
//                   WishlistItem(
//                     name: product.name,
//                     imageUrl: imageUrl,
//                     price: product.sellingPrice,
//                   ),
//                 );
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildDealsText() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: TextWithUnderline(
//         text: 'Deals',
//         subtext: 'View all',
//       ),
//     );
//   }

//   Widget _buildGridProducts(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: _products.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: 0.75,
//       ),
//       itemBuilder: (context, index) {
//         final product = _products[index];
//         String imageUrl = apiImageUrl! + product.productImage!;
//         return ProductCard(
//           text: product.name,
//           price: product.sellingPrice.toString(),
//           url: imageUrl,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProductDetails(
//                   heroTag: 'Listproduct${product.name}',
//                   url: imageUrl,
//                   origin: 'list',
//                   productName: product.name,
//                 ),
//               ),
//             );
//           },
//           heroTag: 'Listproduct${product.name}',
//           addToCart: () {
//             Provider.of<CartModel>(context, listen: false).addItem(
//               CartItem(
//                 name: product.name,
//                 imageUrl: imageUrl,
//                 price: product.sellingPrice,
//               ),
//             );
//             setState(() {
//               cartItems.add(product); // Add to cartItems list
//             });
//           },
//           addToWishlist: () {
//             Provider.of<WishlistModel>(context, listen: false).addItem(
//               WishlistItem(
//                 name: product.name,
//                 imageUrl: imageUrl,
//                 price: product.sellingPrice,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildOurCollectionsText() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: TextWithUnderline(
//         text: 'Our Collections',
//       ),
//     );
//   }

//   Widget _buildImageTextCards() {
//     final List<Map<String, String>> items = [
//       {'image': 'assets/images/poster.png', 'text': 'Cleanse & Prep'},
//       {'image': 'assets/images/poster (1).png', 'text': 'Moisturizing & Protect'},
//       {'image': 'assets/images/poster (2).png', 'text': 'Treat & Nourish'},
//       {'image': 'assets/images/poster (3).png', 'text': 'Body Care'},
//     ];

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: 0.75,
//       ),
//       itemBuilder: (context, index) {
//         return ImageTextCard(
//           imagePath: items[index]['image']!,
//           text: items[index]['text']!,
//         );
//       },
//     );
//   }

//   Widget _buildYouMightLikeText() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: TextWithUnderline(
//         text: 'You might like',
//         subtext: 'View all',
//       ),
//     );
//   }

//   Widget _buildSecondProducts(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: _products.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: 0.75,
//       ),
//       itemBuilder: (context, index) {
//         final product = _products[index];
//         String imageUrl = apiImageUrl! + product.productImage!;
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: ProductCard(
//             text: product.name,
//             price: product.sellingPrice.toString(),
//             url: imageUrl,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetails(
//                     heroTag: 'Listproduct${product.name}',
//                     url: imageUrl,
//                     origin: 'list',
//                     productName: product.name,
//                   ),
//                 ),
//               );
//             },
//             heroTag: 'Listproduct${product.name}',
//             addToCart: () {
//               Provider.of<CartModel>(context, listen: false).addItem(
//                 CartItem(
//                   name: product.name,
//                   imageUrl: imageUrl,
//                   price: product.sellingPrice,
//                 ),
//               );
//               setState(() {
//                 cartItems.add(product); // Add to cartItems list
//               });
//             },
//             addToWishlist: () {
//               Provider.of<WishlistModel>(context, listen: false).addItem(
//                 WishlistItem(
//                   name: product.name,
//                   imageUrl: imageUrl,
//                   price: product.sellingPrice,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sharries_signature/models/cartmodel.dart';
import 'package:sharries_signature/models/product_model.dart';
import 'package:sharries_signature/screens/cartwithsomething.dart';
import 'package:sharries_signature/screens/checkoutscreen.dart';
import 'package:sharries_signature/screens/productdetails.dart';
import 'package:sharries_signature/services/product_services.dart';
import 'package:sharries_signature/utilities/image_textcard.dart';
import 'package:sharries_signature/utilities/productcard.dart';
import 'package:sharries_signature/utilities/reusable_underline.dart';

import '../models/wishlist _model.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  List<Product> _justForYouProducts = [];
  List<Product> _dealsProducts = [];
  List<Product> _youMightLikeProducts = [];
  bool _isLoading = true;

  final apiUrl = dotenv.env['API_URL'];
  final apiKey = dotenv.env['API_KEY'];
  final organizationId = dotenv.env['ORGANIZATION_ID'];
  final appId = dotenv.env['APP_ID'];
  final apiImageUrl = dotenv.env['API_IMAGE_URL'];

  @override
  void initState() {
    super.initState();
    _fetchProductsByCategory('category one', (products) {
      setState(() {
        _justForYouProducts = products;
      });
    });
    _fetchProductsByCategory('category two', (products) {
      setState(() {
        _dealsProducts = products;
      });
    });
    _fetchProductsByCategory('category three', (products) {
      setState(() {
        _youMightLikeProducts = products;
        _isLoading = false;
      });
    });
  }

  Future<void> _fetchProductsByCategory(String category, Function(List<Product>) callback) async {
    ProductServices productServices = ProductServices(
      apiUrl: apiUrl!,
      apiKey: apiKey!,
      organizationId: organizationId!,
      appId: appId!,
    );

    try {
      List<Product> products = await productServices.getProductsByCategory(category);
      callback(products);
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Sharries Signature',
              style: GoogleFonts.redressed(
                fontSize: 24,
                color: const Color(0XFF408C2B),
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navigate to Order History screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
              );
            },
          ),
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/icons8-shopping-cart-48.png'),
            ),
            onPressed: () {
              // Navigate to CartScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CartScreen()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              _buildWelcomeText(),
              const SizedBox(height: 15),
              _buildSearchField(context),
              const SizedBox(height: 20),
              _buildJustForYou(context),
              const SizedBox(height: 20),
              _buildHorizontalProductList(context),
              const SizedBox(height: 40),
              _buildDealsText(),
              const SizedBox(height: 20),
              _buildGridProducts(context, _dealsProducts),
              const SizedBox(height: 50),
              _buildOurCollectionsText(),
              const SizedBox(height: 50),
              _buildImageTextCards(),
              const SizedBox(height: 50),
              _buildYouMightLikeText(),
              const SizedBox(height: 50),
              _buildGridProducts(context, _youMightLikeProducts),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome, Jane',
      style: GoogleFonts.poppins(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 60,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),
          border: InputBorder.none,
          labelText: 'Search',
          labelStyle: GoogleFonts.inter(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildJustForYou(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Just for you',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHorizontalProductList(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _justForYouProducts.map((product) {
          String imageUrl = apiImageUrl! + product.productImage!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ProductCard(
              text: product.name,
              price: product.sellingPrice.toString(),
              url: imageUrl,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      heroTag: 'Listproduct${product.name}',
                      url: imageUrl,
                      origin: 'list',
                      productName: product.name,
                    ),
                  ),
                );
              },
              heroTag: 'Listproduct${product.name}',
              addToCart: () {
                Provider.of<CartModel>(context, listen: false).addItem(
                  CartItem(
                    name: product.name,
                    imageUrl:
                    product.productImage ?? 'assets/images/default.png',
                    price: product.sellingPrice,
                  ),
                );
              },
              addToWishlist: () {
                Provider.of<WishlistModel>(context, listen: false).addItem(
                  WishlistItem(
                    name: product.name,
                    imageUrl:
                    product.productImage ?? 'assets/images/default.png',
                    price: product.sellingPrice,
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDealsText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextWithUnderline(
        text: 'Deals',
        subtext: 'View all',
      ),
    );
  }

  Widget _buildGridProducts(BuildContext context, List<Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        String imageUrl = apiImageUrl! + product.productImage!;
        return ProductCard(
          text: product.name,
          price: product.sellingPrice.toString(),
          url: imageUrl,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  heroTag: 'Listproduct${product.name}',
                  url: imageUrl,
                  origin: 'list',
                  productName: product.name,
                ),
              ),
            );
          },
          heroTag: 'Listproduct${product.name}',
          addToCart: () {
            Provider.of<CartModel>(context, listen: false).addItem(
              CartItem(
                name: product.name,
                imageUrl: imageUrl,
                price: product.sellingPrice,
              ),
            );
          },
          addToWishlist: () {
            Provider.of<WishlistModel>(context, listen: false).addItem(
              WishlistItem(
                name: product.name,
                imageUrl: imageUrl,
                price: product.sellingPrice,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOurCollectionsText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextWithUnderline(
        text: 'Our Collections',
        subtext: '',
      ),
    );
  }

  Widget _buildImageTextCards() {
    final List<Map<String, String>> items = [
      {'image': 'assets/images/poster.png', 'text': 'Cleanse & Prep'},
      {
        'image': 'assets/images/poster (1).png',
        'text': 'Moisturizing & Protect'
      },
      {'image': 'assets/images/poster (2).png', 'text': 'Treat & Nourish'},
      {'image': 'assets/images/poster (3).png', 'text': 'Body Care'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return ImageTextCard(
          imagePath: items[index]['image']!,
          text: items[index]['text']!,
        );
      },
    );
  }

  Widget _buildYouMightLikeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextWithUnderline(
        text: 'You might like',
        subtext: '',
      ),
    );
  }
}