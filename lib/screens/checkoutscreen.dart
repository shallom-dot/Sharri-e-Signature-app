import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _currentStep < 2 ? _nextStep : _completeOrder,
        onStepCancel: _currentStep > 0 ? _previousStep : null,
        steps: _buildSteps(),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(_currentStep < 2 ? 'Next' : 'Finish'),
              ),
              if (_currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Back'),
                ),
            ],
          );
        },
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text('Shipping Information'),
        content: _buildShippingForm(),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Payment Information'),
        content: _buildPaymentForm(),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Review Order'),
        content: _buildReviewOrder(),
        isActive: _currentStep >= 2,
        state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  Widget _buildShippingForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'City'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Postal Code'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your postal code';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Card Number'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your card number';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Expiry Date'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the expiry date';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'CVV'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the CVV';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildReviewOrder() {
    return const Column(
      children: [
        Text(
          'Review your order details below:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ListTile(
          title: Text('Product Name'),
          subtitle: Text('Repair Scrub'),
          trailing: Text('\$19.00'),
        ),
        ListTile(
          title: Text('Shipping Address'),
          subtitle: Text('123 Main Street, City, Postal Code'),
        ),
        ListTile(
          title: Text('Payment Method'),
          subtitle: Text('Credit Card ending in 1234'),
        ),
      ],
    );
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    setState(() {
      _currentStep--;
    });
  }

  void _completeOrder() {
    if (_formKey.currentState!.validate()) {
      // Navigate to order confirmation screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
      );
    }
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thank you for your purchase!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your order has been confirmed and will be processed shortly.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const ListTile(
              title: Text('Product Name'),
              subtitle: Text('Repair Scrub'),
              trailing: Text('\$19.00'),
            ),
            const ListTile(
              title: Text('Shipping Address'),
              subtitle: Text('123 Main Street, City, Postal Code'),
            ),
            const ListTile(
              title: Text('Payment Method'),
              subtitle: Text('Credit Card ending in 1234'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
                );
              },
              child: const Text('View Order History'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderHistoryScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: '1',
      productName: 'Repair Scrub',
      price: 19.00,
      shippingAddress: '123 Main Street, City, Postal Code',
      paymentMethod: 'Credit Card ending in 1234',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Order(
      id: '2',
      productName: 'Healing Balm',
      price: 25.00,
      shippingAddress: '456 Second Street, City, Postal Code',
      paymentMethod: 'Credit Card ending in 5678',
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text(order.productName),
            subtitle: Text('Ordered on ${order.date.toLocal()}'),
            trailing: ElevatedButton(
        onPressed: () {
          // Implement reorder functionality here
        },
        child: const Text('Reorder'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      
      
    
          );
        },
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Product Name: ${order.productName}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Price: \$${order.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Shipping Address:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              order.shippingAddress,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Method:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              order.paymentMethod,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Order Date:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              order.date.toLocal().toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  final String id;
  final String productName;
  final double price;
  final String shippingAddress;
  final String paymentMethod;
  final DateTime date;

  Order({
    required this.id,
    required this.productName,
    required this.price,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.date,
  });
}