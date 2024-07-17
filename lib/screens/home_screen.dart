import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharries_signature/screens/collection_screen.dart';
import 'package:sharries_signature/screens/profile_screen.dart';
import 'package:sharries_signature/screens/search_screen.dart';
import 'package:sharries_signature/screens/wishlist_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CollectionScreen(),
    SearchScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: const ImageIcon(
              AssetImage('assets/images/icons8-shopping-cart-48.png'),
            ),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.grey,
  items: [
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/home.png', color: _selectedIndex == 0? Colors.black : Colors.grey),
      label: 'Home',
      backgroundColor: Colors.black,
    ),
     BottomNavigationBarItem(
      icon: Image.asset('assets/images/heart.png', color: _selectedIndex == 1? Colors.black : Colors.grey),
      label: 'Wishlist',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/user.png', color: _selectedIndex == 2? Colors.black : Colors.grey),
      label: 'Profile',
      backgroundColor: Colors.black,
    ),
     BottomNavigationBarItem(
      icon: Image.asset('assets/images/search.png', color: _selectedIndex == 3? Colors.black : Colors.grey),
      label: 'Search',
      backgroundColor: Colors.black,
    ),
  ],
)
        
    );
  }
}