// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snackbar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static String id = 'AddProduct';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? productName, descr, image, price;
  String? selectedCategory;
  bool isLoading = false;
  final List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Add Product",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 50),
              CustomTextFormField(
                onChanged: (data) => productName = data,
                hintText: 'Product Name',
              ),
              CustomTextFormField(
                onChanged: (data) => descr = data,
                hintText: 'Description',
              ),
              CustomTextFormField(
                textInputType: const TextInputType.numberWithOptions(),
                onChanged: (data) => price = data,
                hintText: 'Price',
              ),
              CustomTextFormField(
                onChanged: (data) => image = data,
                hintText: 'Image URL',
              ),
              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                items: categories
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(
                    () => selectedCategory = value,
                  );
                },
                validator: (val) => val == null ? "Select a category" : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                centerText: "Add",
                onTap: () async {
                  if (productName == null ||
                      descr == null ||
                      price == null ||
                      image == null ||
                      selectedCategory == null) {
                    showSnackBar(
                      context,
                      "Please fill all fields",
                    );
                    return;
                  }

                  setState(() => isLoading = true);
                  try {
                    await addProduct();

                    showSnackBar(context, "✅ Product Added Successfully");
                    Navigator.pop(context);
                  } catch (e) {
                    showSnackBar(context, "Error: $e");
                  }
                  setState(() => isLoading = false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ProductModel> addProduct() {
    return AddProductService(Dio()).addProduct(
      title: productName!,
      price: price!,
      image: image!,
      desc: descr!,
      category: selectedCategory!,
    );
  }
}
