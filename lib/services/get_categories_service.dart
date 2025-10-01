import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  final Dio dio;
  GetAllCategoriesService(this.dio);

  Future<List> getAllCategories() async {
    List<dynamic> jsonData = await Api(Dio()).get(
      url: '$kBaseUrl/products/categories',
    );

    return jsonData;
  }
}
