import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sello_store_app/models/product_model.dart';
import 'package:sello_store_app/services/update_product.dart';
import 'package:sello_store_app/widgets/custom_button.dart';
import 'package:sello_store_app/widgets/custom_textfield.dart';
import 'package:sello_store_app/widgets/show_snack_bar.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      color: const Color(0xffF6FFF8),
      progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6B9080))),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xffEAF4F4),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          forceMaterialTransparency: false,
          iconTheme: IconThemeData(color: Color(0xffCCE3DE), size: 30),
          backgroundColor: Color(0xff6B9080),
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Color(0xffCCE3DE),
              fontSize: 28,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 150,
              ),
              CustomTextField(
                onchange: (data) {
                  productName = data;
                },
                hint: 'Product Name',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onchange: (data) {
                  desc = data;
                },
                hint: 'Description',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onchange: (data) {
                  price = data;
                },
                hint: 'Price',
                textType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onchange: (data) {
                  image = data;
                },
                hint: 'Image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    showSnackBar(context, 'The Product Updates Successfully.');
                  } catch (e) {
                    showSnackBar(context, 'Oops, There was an error : ($e).');
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        id: product.id,
        category: product.category);
  }
}
