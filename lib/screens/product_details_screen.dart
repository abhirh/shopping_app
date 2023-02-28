import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  // const ProductDetailsScreen({Key? key}) : super(key: key);
  // final String title;
  // ProductDetailsScreen({required this.title});
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
              child: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
