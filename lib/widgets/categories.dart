import 'package:flutter/material.dart';
import 'package:newsapp/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 85,
        width: 160,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  category.image,
                )),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          category.text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 248, 24, 24)),
        )),
      ),
    );
  }
}
