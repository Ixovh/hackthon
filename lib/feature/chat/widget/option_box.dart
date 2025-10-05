import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final String imagePath;
  final String text;

  const OptionBox({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 105,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0x1400AA5B), // #00AA5B14, 8% opacity
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(fontSize: 13, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
