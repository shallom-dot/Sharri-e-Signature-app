import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharries_signature/utilities/image_textcard.dart';
import 'package:sharries_signature/utilities/productcard.dart';
import 'package:sharries_signature/utilities/productcardforgrid.dart';
import 'package:sharries_signature/utilities/reusable_underline.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Welcome, Jane',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black), // Add border
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      border: InputBorder.none, // Remove outer border
                      labelText: 'Search',
                      labelStyle: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
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
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
               // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal, // Set horizontal scrolling
                 children: const [
                  ProductCard(text: 'Body milk', price: '19.99',),
                  SizedBox(width: 20,),
                   ProductCard(text: '3 in 1 Repair kit', price: '19.99',),
                  SizedBox(width: 20,),
                   ProductCard(text: '3 in 1 Repair kit', price: '19.99',),
                  SizedBox(width: 20,)
                 ],
              )),
            const SizedBox(height: 40,),
             const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextWithUnderline(text: 'Deals', subtext: 'View all',)
                      
              
             ),
             const SizedBox(height: 20,),
              GridView.builder(
                shrinkWrap: true, // Make the GridView shrink to fit its content
                physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemCount: 6, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10, // Spacing between rows
                  crossAxisSpacing: 10, // Spacing between columns
                  childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                ),
                itemBuilder: (context, index) {
                  return const ProductCardForGrid(text: 'Body milk', price: '19.99',); // Replace with your ProductCard widget
                },
              ),    
               const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextWithUnderline(text: 'Our Collections',),
              ), 
              const SizedBox(height: 50),
              GridView.builder(
                shrinkWrap: true, // Make the GridView shrink to fit its content
                physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemCount: 4, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10, // Spacing between rows
                  crossAxisSpacing: 10, // Spacing between columns
                  childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                ),
                itemBuilder: (context, index) {
                  return ImageTextCard(
                    imagePath: 'assets/images/poster.png', // Replace with your image asset path
                    text: 'Product ${index + 1}', // Replace with your text
                  );
                  }
           ),
           SizedBox(height: 50,),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextWithUnderline(text: 'You might like', subtext: 'View all',)
                      
              
             ),
           const SizedBox(height: 50,),
              GridView.builder(
                shrinkWrap: true, // Make the GridView shrink to fit its content
                physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemCount: 6, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10, // Spacing between rows
                  crossAxisSpacing: 10, // Spacing between columns
                  childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                ),
                itemBuilder: (context, index) {
                  return const ProductCardForGrid(text: 'Body milk', price: '19.99',); // Replace with your ProductCard widget
                },
              ),   
            ]
           )
                     ));
  }
  }