import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  //ProductItem({Key? key}) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_sharp,
                color: Theme.of(context).accentColor,
              )),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              )),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
