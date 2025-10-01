import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;
  ProductModel({
    required this.rating,
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData['category'],
      description: jsonData['description'],
      id: jsonData['id'],
      image: jsonData["image"],
      price: jsonData['price'],
      title: jsonData['title'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(
              jsonData['rating'],
            ),
    );
  }
}
