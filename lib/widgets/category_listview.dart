import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/services/get_categories_service.dart';
import 'package:store_app/widgets/category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FutureBuilder<List<dynamic>>(
        future: GetAllCategoriesService(Dio()).getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> categories = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  category: categories[index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
