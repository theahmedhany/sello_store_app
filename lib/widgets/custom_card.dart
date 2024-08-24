import 'package:flutter/material.dart';
import 'package:sello_store_app/models/product_model.dart';
import 'package:sello_store_app/screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Color(0xff6B9080).withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              color: Color(0xffEAF4F4),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style: const TextStyle(
                          color: Color(0xff6B9080),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffA4C3B2),
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            size: 26,
                            color: Color(0xff6B9080),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 85,
            child: Image.network(
              product.image,
              height: 110,
              width: 110,
            ),
          )
        ],
      ),
    );
  }
}
