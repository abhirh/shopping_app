import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/product_details_screen.dart';
import './screens/cart_screen.dart';
import './providers/orders_provider.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './providers/auth_provider.dart';
import './screens/products_overview_screen.dart';
import './screens/splash_screen.dart';
import './helpers/custom_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', '', []),
          update: (context, auth, previousProducts) => Products(
              auth.token.toString(),
              auth.userId.toString(),
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders('', '', []),
          update: (context, auth, previousProducts) => Orders(
              auth.token.toString(),
              auth.userId.toString(),
              previousProducts == null ? [] : previousProducts.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.blueAccent,
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            }),
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          },
        ),
      ),
    );
  }
}
