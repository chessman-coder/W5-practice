import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Product',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              ProductCard(
                image: Product.dart.image,
                title: Product.dart.title,
                description: Product.dart.description,
              ),
              ProductCard(
                image: Product.flutter.image,
                title: Product.flutter.title,
                description: Product.flutter.description,
              ),
              ProductCard(
                image: Product.firebase.image,
                title: Product.firebase.title,
                description: Product.firebase.description,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(-1, 0),
            child: Image.asset(image, width: 100, height: 100),
          ),
          Text(title, style: TextStyle(fontSize: 24)),
          Text(description, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'lib/assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile wider library',
    image: 'lib/assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'lib/assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}
