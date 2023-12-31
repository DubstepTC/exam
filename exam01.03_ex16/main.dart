import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CosmeticStoreScreen(),
    );
  }
}

class CosmeticStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Косметика'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: cosmeticProducts.length,
        itemBuilder: (context, index) {
          return CosmeticProductItem(product: cosmeticProducts[index]);
        },
      ),
    );
  }
}

class CosmeticProductItem extends StatelessWidget {
  final Product product;

  CosmeticProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.imageUrl, // использование локальной картинки из assets
            fit: BoxFit.cover, // чтобы изображение занимало всю доступную область
          ),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'), // форматирование до двух знаков после запятой
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

List<Product> cosmeticProducts = [
  Product(
    name: "Помада",
    imageUrl: "assets/kat.jpg",
    price: 10.99,
  ),
  // Другие продукты
];
