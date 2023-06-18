import 'package:demo_ecom/models/model_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart/cart.dart';
import 'details_provider.dart';

class Details extends StatefulWidget {
  final ProductModel productModel;
  const Details({Key? key, required this.productModel}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(widget.productModel.category),
      child: Consumer<DetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return const Cart();
                    }));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  padding: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  child: Image.network(widget.productModel.image),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Product - ',
                              ),
                              Text(
                                widget.productModel.title,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Text(
                                    'Price -  ',
                                  ),
                                  Text(
                                    "${widget.productModel.price} \$",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Description -',
                              ),
                              Text(
                                widget.productModel.description,
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Similar items',
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 110,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: provider.sameProducts.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (ctx) {
                                            return Details(
                                                productModel: provider.sameProducts[index]);
                                          }));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.cyan[100],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Image(
                                          height: 70,
                                          image:
                                          NetworkImage(provider.sameProducts[index].image),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 60,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        //addToCart(widget.productModel);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.cyan[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text("Add To Cart"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        //addToCart(widget.productModel);
                        //Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        //  return const CartPage();
                       // }));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.cyan[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text("Checkout"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
