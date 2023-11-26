import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин одежды',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Product(
      name: "Платье",
      imageUrl: "assets/kat.jpg",
      description: "Красивое платье для особых случаев",
      price: 99.99,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о продукте'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                product.imageUrl, // использование локальной картинки из assets
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Цена: \$${product.price.toStringAsFixed(2)}', // форматирование до двух знаков после запятой
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
