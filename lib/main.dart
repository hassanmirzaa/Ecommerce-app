import 'package:flutter/material.dart';import 'package:ios_app/views/login_screen.dart';
import 'package:provider/provider.dart';


void main() {
 runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphism Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}













// Mock data
final List<String> categories = [
  'All',
  'Electronics',
  'Fashion',
  'Home',
  'Beauty',
  'Sports',
];


// Add this to your main.dart (after the Product class)
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int newQuantity) {
    final existingIndex = _items.indexWhere((item) => item.product.id == productId);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity = newQuantity;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
class Product {
  final String id;
  final String name;
  final String vendor;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.vendor,
    required this.price,
    required this.image,
  });
}

final List<Product> products = [
  Product(
    id: '1',
    name: 'Nike Shoes',
    vendor: 'Nike',
    price: 129.99,
    image: 'assets/images/shoes.png',
  ),
  Product(
    id: '2',
    name: 'Premium Perfume',
    vendor: 'Lattafa',
    price: 29.99,
    image: 'assets/images/f9b5a98a-b892-4b42-8ba1-f8d2c196edd1-removebg-preview.png',
  ),
  Product(
    id: '3',
    name: 'White Tshirt',
    vendor: 'Nike',
    price: 89.99,
    image: 'assets/images/white shirt.png',
  ),
  Product(
    id: '4',
    name: 'Airpods',
    vendor: 'Apple',
    price: 59.99,
    image: 'assets/images/airpods.png',
  ),
  Product(
    id: '5',
    name: 'Classic Leather Wallet',
    vendor: 'Olorky',
    price: 39.99,
    image: 'assets/images/wallet.png',
  ),
  Product(
    id: '6',
    name: 'Nike P Cap',
    vendor: 'SunShades',
    price: 79.99,
    image: 'assets/images/images-removebg-preview.png',
  ),
];