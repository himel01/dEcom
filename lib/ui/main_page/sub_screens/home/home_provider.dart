import 'package:demo_ecom/models/model_product.dart';
import 'package:demo_ecom/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  List<ProductModel> products = [];

  HomeProvider(BuildContext context) {
    getProducts();

  }

  Future<void> getProducts() async {
    products= await ApiService().fetchProducts() ;
    notifyListeners();
  }
}