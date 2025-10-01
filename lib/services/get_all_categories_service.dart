import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoriesService {
  final Dio dio;
  GetCategoriesService(this.dio);

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> jsonData =
        await Api(Dio()).get(url: '$kBaseUrl/products/category/$categoryName');

    List<ProductModel> categoryList = [];
    for (int i = 0; i < jsonData.length; i++) {
      ProductModel category = ProductModel.fromJson(
        jsonData[i],
      );
      categoryList.add(category);
    }
    return categoryList;
  }
}
