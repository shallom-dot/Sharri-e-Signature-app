import 'package:flutter/material.dart';
import 'package:sharries_signature/screens/collection_screen.dart';
import 'package:sharries_signature/screens/orderscreen.dart';
import 'package:sharries_signature/screens/profile_screen.dart';
import 'package:sharries_signature/screens/search_screen.dart';
import 'package:sharries_signature/screens/wishlist_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CollectionScreen(),
    const SearchScreen(),
     WishlistScreen(),
    const ProfileScreen(),
    OrdersScreen(), // Add the OrderScreen to the list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/search.png',
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/heart.png',
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
