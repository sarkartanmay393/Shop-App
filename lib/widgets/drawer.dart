import 'package:flutter/material.dart';

import '../screens/OrderScreen.dart';
import '../screens/ProductManageScreen.dart';
import './favorite.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
              title: Text(
                "SHOP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: false),
          Divider(
            height: 5,
          ),
          ListTile(
            title: Text(
              "Favorites",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            style: ListTileStyle.drawer,
            leading: Icon(Icons.favorite, color: Colors.red.shade400,),
            onTap: () {
              Navigator.of(context).pushNamed(Favorite.routeName);
            },
          ),
          ListTile(
            title: Text(
              "Orders",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            style: ListTileStyle.drawer,
            leading: Icon(Icons.shopping_cart, color: Colors.red.shade400,),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              "Manage Product",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            style: ListTileStyle.drawer,
            leading: Icon(Icons.edit, color: Colors.red.shade400,),
            onTap: () {
              Navigator.of(context).pushNamed(ProductManageScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
