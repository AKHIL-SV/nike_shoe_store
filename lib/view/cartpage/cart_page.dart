import 'package:flutter/material.dart';
import 'package:nike_shoping_app/controller/product_controller.dart';
import 'package:nike_shoping_app/view/cartpage/cart_items.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _cartitems = context.watch<Items>().cartitems;

    return Scaffold(
      appBar: AppBar(
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
            onPressed: null,
            elevation: 0,
            child: Text('${_cartitems.length}'),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'My Bag',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _cartitems.length,
                  itemBuilder: (ctx, index) {
                    return CartItems(
                      imagepath: _cartitems[index][3],
                      name: _cartitems[index][1],
                      price: _cartitems[index][2],
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38),
                  ),
                  trailing: Text(
                    '\$${_cartitems.length * 270.00}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.black87,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text('Checkout'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
