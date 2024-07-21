import 'package:flutter/material.dart';
import 'package:sharries_signature/screens/checkoutscreen.dart';
import 'package:sharries_signature/screens/collection_screen.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
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
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/deliveryguy.png', // replace with your image asset path
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'No ongoing orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You\'ll be able to see your ongoing orders here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff408C2B),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 8.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CollectionScreen()),
                                  );
                                },
                                child: const Text(
                                  'Place an Order',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}



class PlaceOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place an Order'),
      ),
      body: const Center(
        child: Text('Place order functionality will be here'),
      ),
    );
  }
}
