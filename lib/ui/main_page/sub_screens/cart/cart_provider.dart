import 'package:flutter/cupertino.dart';

import '../../../../models/model_product.dart';
import '../../../../services/database_service.dart';

class CartProvider extends ChangeNotifier{
  List<ProductModel> products = [];
  double total = 0.0;
  CartProvider()  {
     retrieve();
  }

  Future<void> retrieve() async {
    if(products.isEmpty){
      var list= await DatabaseService.cart();
      if(list.isNotEmpty){
        products=list;
        for (var element in products) {
          total = total + element.price;
        }
        notifyListeners();
      }
    }

  }
  delete(ProductModel productModel) async {
    await DatabaseService.deleteProduct(productModel.id, "Cart");
    products.remove(productModel);
    notifyListeners();

  }
}