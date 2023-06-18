import 'package:flutter/cupertino.dart';

import '../../../../../models/model_product.dart';
import '../../../../../services/api_service.dart';

class DetailsProvider extends ChangeNotifier {
  List<ProductModel> sameProducts = [];

  DetailsProvider(String category) {
    getSameProducts(category);
  }

  Future<void> getSameProducts(String c) async {
    sameProducts = await ApiService().fetchProductsCategory(c);

    notifyListeners();
  }
}
