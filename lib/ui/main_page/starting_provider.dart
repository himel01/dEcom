import 'package:demo_ecom/ui/main_page/sub_screens/cart/cart.dart';
import 'package:demo_ecom/ui/main_page/sub_screens/home/home.dart';
import 'package:flutter/material.dart';

class FirstPageProvider extends ChangeNotifier {
  FirstPageProvider(BuildContext context) {}

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> buildScreens() {
    return [
      const Home(),
      const Cart(),
    ];
  }
}
