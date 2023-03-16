import 'package:flutter/material.dart';
import 'package:nike_shoping_app/controller/product_controller.dart';
import 'package:nike_shoping_app/view/cartpage/cart_page.dart';
import 'package:nike_shoping_app/view/homepage/productlist.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          const Icon(
            Icons.search,
            size: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_rounded,
              size: 30,
            ),
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            elevation: 0,
            child: Consumer<Items>(
              builder: (context, cart, child) {
                return Text('${cart.cartitems.length}');
              },
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Shoes',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.expand_more_outlined)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<Items>(
                builder: (context, items, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: items.products.length,
                    itemBuilder: (ctx, index) {
                      return Products(
                        imgpath: items.products[index][3],
                        name: items.products[index][1],
                        price: items.products[index][2],
                        index: index,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
