import 'package:flutter/material.dart';
import 'package:newsapp/models/artical_model.dart';

class NewTitle extends StatelessWidget {
  const NewTitle({super.key, required this.articalModel});
  final ArticalModel articalModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            articalModel.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          articalModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          selectionColor: Colors.black,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          articalModel.subtitle,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
