// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snackbar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, descr, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 8,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "UpdateProduct",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              CustomTextFormField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              CustomTextFormField(
                onChanged: (data) {
                  descr = data;
                },
                hintText: 'Description',
              ),
              CustomTextFormField(
                textInputType: TextInputType.numberWithOptions(),
                onChanged: (data) {
                  price = data;
                },
                hintText: 'Price',
              ),
              CustomTextFormField(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'Image',
              ),
              SizedBox(
                height: 69,
              ),
              CustomButton(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(productModel);
                    showSnackBar(
                      context,
                      "Success Update",
                    );
                  } catch (e) {
                    showSnackBar(
                      context,
                      "There is an error, $e",
                    );
                  }
                  isLoading = false;
                  setState(() {});
                },
                centerText: "Update",
              ),
            ],
          ),
        ),
        
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService(Dio()).updateProduct(
      id: productModel.id,
      title: productName ?? productModel.title,
      price: price ?? productModel.price.toString(),
      image: image ?? productModel.image,
      desc: descr ?? productModel.description,
      category: productModel.category,
    );
  }
}
