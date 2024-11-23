import 'package:flutter/material.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/widgets/categories.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<Category> categories = const [
    Category(image: 'assets/technology.jpeg', text: 'Business'),
    Category(image: 'assets/technology.jpeg', text: 'entertaiment'),
    Category(image: 'assets/technology.jpeg', text: 'general'),
    Category(image: 'assets/technology.jpeg', text: 'health'),
    Category(image: 'assets/technology.jpeg', text: 'science'),
    Category(image: 'assets/technology.jpeg', text: 'sports'),
    Category(image: 'assets/technology.jpeg', text: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Categories(
              category: categories[index],
            );
          }),
    );
  }
}
