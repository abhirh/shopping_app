import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  // const ProductDetailsScreen({Key? key}) : super(key: key);
  // final String title;
  // ProductDetailsScreen({required this.title});
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
