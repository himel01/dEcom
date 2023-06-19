import 'package:demo_ecom/models/model_product.dart';
import 'package:demo_ecom/services/api_service.dart';
import 'package:demo_ecom/services/database_service.dart';
import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier{
  List<ProductModel> products = [];

  HomeProvider(BuildContext context) {
    getProducts();
  }

  Future<void> getProducts() async {
    products= await ApiService().fetchProducts() ;
    notifyListeners();
    await saveProducts();
    await retrieve();
  }

  Future<void> saveProducts() async {
    if(products.isNotEmpty){
      for (var element in products) {
        await DatabaseService.insertProduct(element);
      }
    }
  }

  sortProducts(){
    products.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  Future<void> retrieve() async {
    if(products.isEmpty){
      var list= await DatabaseService.products();
      if(list.isNotEmpty){
        products=list;
        notifyListeners();
      }
    }
  }


}