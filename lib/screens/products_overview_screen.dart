import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/widgets/products_grid.dart';
import 'package:shopping_app/widgets/badge.dart' as mybadge;

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // const ProductsOverviewScreen({Key? key}) : super(key: key);
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('My Shopping App'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedVal) {
                setState(() {
                  if (selectedVal == FilterOptions.Favorites) {
                    //...
                    _showOnlyFavorites = true;
                  } else {
                    //...
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      value: FilterOptions.Favorites,
                      child: Text(' Only Favourites'),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text(' Show all'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                mybadge.Badge(value: cartData.itemCount.toString(), child: ch!),
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductsGrid(
        showFavs: _showOnlyFavorites,
      ),
    );
  }
}
