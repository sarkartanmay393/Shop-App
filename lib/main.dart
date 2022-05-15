import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/TabScreen.dart';
import './widgets/home.dart';
import './widgets/categories.dart';
import './widgets/offers.dart';
import './widgets/wallet.dart';
import './screens/ProductDetailsScreen.dart';
import './providers/products-provider.dart';
import './providers/cart-provider.dart';
import './screens/CartScreen.dart';
import './widgets/favorite.dart';
import './providers/order-provider.dart';
import './screens/OrderScreen.dart';
import './screens/ProductManageScreen.dart';
import './screens/AddNewScreen.dart';
import './screens/AuthScreen.dart';
import './screens/EditScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ // adding multiple providers.
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider(create: (_) => Order()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zometo',
        theme: ThemeData(
          fontFamily: "SourceSans Pro",
          primarySwatch: Colors.red,
          //canvasColor: MaterialColor(1, {1: Color.fromRGBO(244, 244, 242, 100)}),
          // primaryTextTheme: TextTheme(
          //   headlineSmall: TextStyle(
          //     fontFamily: "SourceSans Pro",
          //     color: Colors.black,
          //     fontSize: 13,
          //     fontWeight: FontWeight.w700,
          //   ),
          //   headline1: TextStyle(
          //     fontFamily: "SourceSans Pro",
          //     color: Colors.black,
          //     fontSize: 22,
          //     fontWeight: FontWeight.w500,
          //   ),
          //
          // ),
        ),
        initialRoute: AuthScreen.routeName,
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
          TabScreen.routeName: (context) => TabScreen(),
          Home.routeName: (context) => Home(),
          Categories.routeName: (context) => Categories(),
          Offers.routeName: (context) => Offers(),
          Wallet.routeName: (context) => Wallet(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          Favorite.routeName: (context) => Favorite(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          ProductManageScreen.routeName: (context) => ProductManageScreen(),
          AddNewScreen.routeName: (context) => AddNewScreen(),
          EditScreen.routeName: (context) => EditScreen(),
        },
      ),
    );
  }
}
