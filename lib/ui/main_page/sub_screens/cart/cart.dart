import 'package:demo_ecom/ui/main_page/sub_screens/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Shopping Cart"),backgroundColor: Colors.cyan[300],
            ),
            body: provider.products.isEmpty
                ? const Center(
              child: Text("Your Cart is Empty"),
            )
                : SizedBox(
              height: h,
              width: w,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            margin:
                            const EdgeInsets.only(left: 10.0, right: 10.0),
                            alignment: Alignment.center,
                            height: h * 0.1,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.cyan[200],
                                border:
                                Border.all(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h * 0.08,
                                  width: h * 0.08,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(provider.products[i].image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: w * 0.6,
                                      child: Text(
                                        provider.products[i].title,
                                        style: TextStyle(
                                          fontSize: h * 0.025,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.6,
                                      child: Text(
                                        "Price : ${provider.products[i].price} \$",
                                        style: TextStyle(
                                          fontSize: h * 0.025,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    provider.delete(provider.products[i]);
                                  },
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: provider.products.length,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10.0,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: provider.products.isNotEmpty
                ? Container(
              height: h * 0.12,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${provider.total} \$",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment in process! Meanwhile browse other products."),
                        ),
                      );
                    },
                    child: Container(
                      height: h * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Proceed to Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
                : null,
          );
        },
      ),
    );
  }
}
