import 'package:demo_ecom/ui/main_page/starting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirstPageProvider(context),
      child: Consumer<FirstPageProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: provider.buildScreens().elementAt(provider.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 50.0,
              currentIndex: provider.selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: "Cart"),
              ],
              onTap: provider.onItemTapped,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: const IconThemeData(
                color: Colors.black45,
              ),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white38,
            ),
          );
        },
      ),
    );
  }
}
