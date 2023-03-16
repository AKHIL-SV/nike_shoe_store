import 'package:flutter/material.dart';
import 'package:nike_shoping_app/controller/product_controller.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  final String name, price, imgpath;
  final int index;
  const Products(
      {super.key,
      required this.name,
      required this.price,
      required this.imgpath,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgpath),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ $price.00',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Consumer<Items>(
                builder: (context, cart, child) {
                  return InkWell(
                    onTap: () {
                      if (!cart.cartitems.contains(cart.products[index])) {
                        context.read<Items>().addtocart(index);
                      } else {}
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.black87,
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
