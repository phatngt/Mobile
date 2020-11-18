import 'dart:convert';

import 'package:flutterproject/models/Products.dart';
import 'package:http/http.dart' as http;

//Fetch our project from API
Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  final respone = await http.get(apiUrl);

  if (respone.statusCode == 200) {
    //If the server did return a 200 OK response.
    //then parse the JSON
    List<Product> products = (json.decode(respone.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return products;
  } else {
    throw Exception("Failed to load");
  }
}
