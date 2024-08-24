import 'package:flutter/material.dart';
import 'package:sello_store_app/models/product_model.dart';
import 'package:sello_store_app/services/get_all_product_service.dart';
import 'package:sello_store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF4F4),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: false,
        backgroundColor: Color(0xff6B9080),
        centerTitle: true,
        title: const Text(
          'Sello',
          style: TextStyle(
            color: Color(0xffCCE3DE),
            fontSize: 35,
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 100,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: products[index],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6B9080)),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
