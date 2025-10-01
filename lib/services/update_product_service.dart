import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Dio dio;
  UpdateProductService(this.dio);

  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String image,
    required String desc,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> jsonData = await Api(Dio()).put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromJson(jsonData);
  }
}
