import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  final Dio dio;
  GetAllProductsService(this.dio);

  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> jsonData = await Api(Dio()).get(
      url: "$kBaseUrl/products",
    );

    List<ProductModel> productsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      ProductModel product = ProductModel.fromJson(
        jsonData[i],
      );
      productsList.add(product);
    }

    return productsList;
  }
}
