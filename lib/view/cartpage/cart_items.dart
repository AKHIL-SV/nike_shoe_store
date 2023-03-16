import 'package:flutter/material.dart';
import 'package:nike_shoping_app/controller/product_controller.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String imagepath, name, price;
  final int index;
  const CartItems(
      {super.key,
      required this.imagepath,
      required this.name,
      required this.price, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(imagepath),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: InkWell(
                      onTap: () {
                        context.read<Items>().removefromcart(index);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black26,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$ $price.00',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
