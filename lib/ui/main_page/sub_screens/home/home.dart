import 'package:demo_ecom/ui/main_page/sub_screens/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details/product_details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(context),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: h * 0.08,
                ),
                Container(
                  margin: EdgeInsets.only(left: w * 0.05),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.07,
                    ),
                  ),
                ),
                provider.products.isNotEmpty
                    ? Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            provider.products.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (ctx) {
                                                  return Details(
                                                      productModel: provider.products[index]);
                                                }));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.cyan[100],
                                        border: Border.all(
                                            color: Colors.black, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: h * 0.06,
                                          width: h * 0.06,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(provider
                                                    .products[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.circle),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: w * 0.3,
                                              child: Text(
                                                provider.products[index].title,
                                                style: TextStyle(
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: w * 0.3,
                                              child: Text(
                                                "Price : ${provider.products[index].price} \$",
                                                style: TextStyle(
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: h * 0.4),
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
