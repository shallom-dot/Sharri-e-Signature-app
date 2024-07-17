import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharries_signature/utilities/row_with_two_texts.dart';
import 'package:sharries_signature/utilities/rowswithtwo_images.dart';
import 'package:sharries_signature/utilities/stacked_images.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
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
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const ImageIcon(AssetImage('assets/images/arrow-left.png')),
                          ),
                          const SizedBox(width: 16), // add a spacer with a width of 16
                          const ImageIcon(AssetImage('assets/images/icons8-shopping-cart-48.png')),
                        ],
                      ),
                      StackedImageCard(backgroundImagePath: 'assets/images/image 30.png', foregroundImagePath: 'assets/images/Cream Jar Mockup.png'),
                    ],
                  ),
                ),
              ),
              const RowWithTwoImages(
                imagePath1: 'assets/images/Repair scrub container.png', 
                imagePath2: 'assets/images/Carousel card.png',),

                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: RowWithTwoTexts(text1: 'RS34670', text2: 'In Stock',),
                ),
              const SizedBox(height: 30),
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Align(alignment:Alignment.topLeft,
                         child:  Text('Repair Scrub',
                         style: TextStyle(
                          fontSize: 24,
                          height: 1.2,
                          fontWeight: FontWeight.bold
                         ),)),
                      SizedBox(height: 15,),
                      Text(
                                 'Our Repair Body Scrub is expertly crafted to rejuvenate and revitalize your skin. This luxurious scrub combines natural exfoliants with nourishing ingredients to gently remove dead skin cells, promote cell renewal, and restore your skin\'s natural radiance.',
                                 maxLines: 6,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(fontSize: 16,
                                ),
                               ),
                      ],
                     ),
                   ),
             const SizedBox(height: 16), // Spacer
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Made with pure natural ingredients',
                    style: TextStyle(
                      color: Color(0xFF4EAB35),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24), // Spacer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 334,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How to use ',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacer
              Container(
                width: 334,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Delivery and drop-off',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Spacer
              Container(
                width: 430,
                height: 84,
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 48,
                  right: 48,
                  bottom: 32,
                ),
                decoration: const BoxDecoration(color: Color(0xFF408C2B)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 81,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Sub',
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                         
                            child: Text(
                              '\$19.00',
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 18,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Opacity(
                      opacity: 0.90,
                      child: Container(
                        width: 152,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10.18),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Color(0xFFFAFAFA)),
                            borderRadius: BorderRadius.circular(3.82),
                          ),
                        ),
                  
                              
                         
                              child: Text(
                                'Add to Cart',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                                       )
                                                       ),
                            )
                         
                      ),
        
    ]  ),
        )
        ])
    )));
  }
}
