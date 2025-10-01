import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Dio dio;
  AddProductService(this.dio);

  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String image,
    required String desc,
    required String category,
  }) async {
    Map<String, dynamic> jsonData = await Api(Dio()).post(
      url: 'https://fakestoreapi.com/products',
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
