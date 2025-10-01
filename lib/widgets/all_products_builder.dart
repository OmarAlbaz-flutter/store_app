import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card_widget.dart';

class AllProductsBuilder extends StatelessWidget {
  const AllProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: GetAllProductsService(Dio()).getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          return SliverPadding(
            padding: EdgeInsetsGeometry.only(top: 100),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CustomCard(productModel: products[index]);
                },
                childCount: products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.34,
                mainAxisSpacing: 50,
                crossAxisSpacing: 16,
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
