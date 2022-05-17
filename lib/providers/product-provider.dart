import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  String category;
  bool isFavorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.category,
      this.isFavorite = false});

  Future<void> toggleFavorite(String authToken) async {
    var backup = isFavorite;
    final url = Uri.parse(
        "https://shop-app-82853-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken");
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        isFavorite = backup;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = backup;
      notifyListeners();
    }
  }
}
