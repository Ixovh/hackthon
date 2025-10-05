import 'package:flutter/material.dart';

class DetailsImages extends StatelessWidget {
  const DetailsImages({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 852,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
