import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/model_product.dart';

class ApiService {
  final String productsApi = "https://fakestoreapi.com/products";
  final String productsCategoryApi =
      "https://fakestoreapi.com/products/category/";

  final String categories = "https://fakestoreapi.com/products/categories";

  //final String user = "https://fakestoreapi.com/users/";

  Future<List<ProductModel>> fetchProducts() async {
    var response;
    try{
       response = await http.get(
        Uri.parse(productsApi),
      );

    }catch(e){
      print(e);
    }
    if (response!=null && response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return [];
    }

  }

  Future<List<ProductModel>> fetchProductsCategory(String category) async {
    final response = await http.get(
      Uri.parse(productsCategoryApi + category),
    );
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return [];
      //throw Exception('Failed to load ');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(categories),
    );
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body).map((x) => x));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
