import 'package:flutter/material.dart';
import 'package:sharries_signature/screens/cartwithsomething.dart';
import 'package:sharries_signature/utilities/row_with_two_texts.dart';
import 'package:sharries_signature/utilities/rowswithtwo_images.dart';
import 'package:sharries_signature/utilities/stacked_images.dart';

class ProductDetails extends StatefulWidget {
  final String heroTag;
  final String url;
  final String origin;
  final String productName;

  const ProductDetails({
    Key? key,
    required this.heroTag,
    required this.url,
    required this.origin,
    required this.productName,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isCartVisible = false;
  int quantity = 1;
  final double unitPrice = 19.00;

  void _toggleCartVisibility() {
    setState(() {
      _isCartVisible = !_isCartVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayTag = '';

    switch (widget.origin) {
      case 'list':
        displayTag = widget.heroTag + '_list';
        break;
      case 'grid':
        displayTag = widget.heroTag + '_grid';
        break;
      default:
        displayTag = widget.heroTag;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 400,
                color: const Color(0xFFE4F5E0),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const ImageIcon(
                                AssetImage('assets/images/arrow-left.png'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const ImageIcon(
                            AssetImage(
                                'assets/images/icons8-shopping-cart-48.png'),
                          ),
                        ],
                      ),
                      Hero(
                        tag: displayTag,
                        child: StackedImageCard(
                          backgroundImagePath: 'assets/images/image 30.png',
                          foregroundImagePath: widget.url,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const RowWithTwoImages(
                imagePath1: 'assets/images/Repair scrub container.png',
                imagePath2: 'assets/images/Carousel card.png',
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: RowWithTwoTexts(text1: 'RS34670', text2: 'In Stock'),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.productName,
                        style: const TextStyle(
                          fontSize: 24,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Our ${widget.productName} is expertly crafted to rejuvenate and revitalize your skin. This luxurious scrub combines natural exfoliants with nourishing ingredients to gently remove dead skin cells, promote cell renewal, and restore your skin\'s natural radiance.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'How to use ',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Delivery and drop-off',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(color: Color(0xFF408C2B)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$19.00',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 18,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: 0.90,
                      child: GestureDetector(
                        onTap: _toggleCartVisibility,
                        child: Container(
                          width: 152,
                          height: 40,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2, color: Color(0xFFFAFAFA)),
                              borderRadius: BorderRadius.circular(3.82),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Add to Cart',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isCartVisible)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: Center(
                              child: Text(
                                '$quantity',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.green[50],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                onPressed: _toggleCartVisibility,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Unit price',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  '\$${unitPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff408C2B),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 8.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()),
                                  );
                                },
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
